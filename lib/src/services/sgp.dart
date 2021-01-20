import 'package:dio/dio.dart';
import 'package:dsd/src/models/bitstream.dart';
import 'package:dsd/src/models/collection.dart';
import 'package:dsd/src/models/community.dart';
import 'package:dsd/src/models/item.dart';
import 'package:dsd/src/models/pedido.dart';
import 'package:dsd/src/models/vinculo.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import '../models/servico.dart';

class SgpApi {
  Dio dio = new Dio();

  String ip = 'http://192.168.43.23:4000';

  String dspace = 'https://demo.dspace.org/rest';

  String local = 'http://192.168.43.23:8080/rest';

  Future<bool> saveEmail(String email) async {
    SharedPreferences instance = await SharedPreferences.getInstance();

    if (await instance.setString('email', email)) return true;

    return false;
  }

  Future<String> getEmail() async {
    SharedPreferences instance = await SharedPreferences.getInstance();

    return instance.getString('email');
  }

  Future<String> getKey(String key) async {
    SharedPreferences instance = await SharedPreferences.getInstance();

    return instance.getString(key);
  }

  Future<bool> saveKey(String key, String value) async {
    SharedPreferences instance = await SharedPreferences.getInstance();

    if (await instance.setString(key, value)) return true;

    return false;
  }

  Future<String> getIP() async {
    String ip;

    try {
      Response response = await dio.get('https://api.ipify.org?format=json');

      if (response.statusCode == 200) {
        return response.data['ip'];
      }

      return ip;
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Servico>> getServicos() async {
    List<Servico> servicos = [];

    try {
      Response response = await dio.get('$ip/servicos');

      if (response.statusCode == 200) {
        List jsonServicos = response.data;

        for (var servico in jsonServicos)
          servicos.add(Servico.fromJson(servico));

        return servicos;
      }
    } on Exception catch (e) {
      print(e);
    }

    return servicos;
  }

  Future<List<Vinculo>> getVinculos() async {
    List<Vinculo> vinculos = [];

    try {
      Response response = await dio.get('$ip/vinculos');

      if (response.statusCode == 200) {
        List jsonVinculos = response.data;

        for (var vinculo in jsonVinculos)
          vinculos.add(Vinculo.fromJson(vinculo));

        return vinculos;
      }
    } on Exception catch (e) {
      print(e);
    }

    return vinculos;
  }

  Future<List<Pedido>> getPedidos() async {
    List<Pedido> pedidos = [];

    try {
      String email = await getEmail();
      print(email);

      Response response = await dio.get('$ip/pedidos?email=$email');

      if (response.statusCode == 200) {
        List jsonPedidos = response.data;

        for (var pedido in jsonPedidos) pedidos.add(Pedido.fromJson(pedido));

        return pedidos;
      }
    } on Exception catch (e) {
      print(e);
    }

    return pedidos;
  }

  Future<bool> postPedidos(String nome, String email, int servicoId,
      int vinculoId, String detalhes, String comprovativo) async {
    try {
//      Response response = await Dio().post('$ip/pedidos',
//          data: jsonEncode(<String, dynamic>{
//            'nome': nome,
//            'email': email,
//            'servicoId': servicoId,
//            'vinculoId': vinculoId,
//            'detalhes': detalhes
//          }));

//      String mimeType;
//      if(comprovativo != null)
//        mimeType = mime(comprovativo);
//
//      MediaType mediaType = MediaType.parse(mimeType);

      Response response;

      if (comprovativo != null) {
        response = await Dio().post('$ip/pedidos',
            data: FormData.fromMap(<String, dynamic>{
              'nome': nome,
              'email': email,
              'servicoId': servicoId,
              'vinculoId': vinculoId,
              'detalhes': detalhes,
              'comprovativo': await MultipartFile.fromFile(comprovativo)
            }));
      } else {
        response = await Dio().post('$ip/pedidos',
            data: FormData.fromMap(<String, dynamic>{
              'nome': nome,
              'email': email,
              'servicoId': servicoId,
              'vinculoId': vinculoId,
              'detalhes': detalhes,
            }));
      }

      if (response.statusCode == 201) {
        await saveKey('nome', nome);
        await saveEmail(email);
        return true;
      } else
        return false;
    } on Exception catch (e) {
      print(e);
    }

    return false;
  }

  Future<List<Community>> getCommunities({int repositorio}) async {
    List<Community> lista = [];

    try {
      Response response;

      if (repositorio != null)
        response = await dio.get('$local/communities');
      else
        response = await dio.get('$dspace/communities');

      if (response.statusCode == 200) {
        List jsonLista = response.data;

        for (var item in jsonLista) lista.add(Community.fromJson(item));

        return lista;
      }
    } on Exception catch (e) {
      print(e);
    }

    return lista;
  }

  Future<List<Collection>> getCollections(String uuid,
      {int repositorio}) async {
    List<Collection> lista = [];

    try {
      Response response;

      if (repositorio != null)
        response = await dio.get('$local/communities/$uuid/collections');
      else
        response = await dio.get('$dspace/communities/$uuid/collections');

      if (response.statusCode == 200) {
        List jsonLista = response.data;

        for (var item in jsonLista) {
          lista.add(Collection.fromJson(item));

          print(Collection.fromJson(item).name);
        }

        return lista;
      }
    } on Exception catch (e) {
      print(e);
    }

    return lista;
  }

  Future<List<Item>> getItems(String uuid, {int repositorio}) async {
    List<Item> lista = [];

    try {
      Response response;

      if (repositorio != null)
        response =
            await dio.get('$local/collections/$uuid/items?expand=metadata');
      else
        response =
            await dio.get('$dspace/collections/$uuid/items?expand=metadata');

      if (response.statusCode == 200) {
        List jsonLista = response.data;

        for (var item in jsonLista) {
          lista.add(Item.fromJson(item));

          print(Item.fromJson(item).name);
        }

        return lista;
      }
    } on Exception catch (e) {
      print(e);
    }

    return lista;
  }

  Future<List<Bitstream>> getBitstreams(String uuid) async {
    List<Bitstream> lista = [];

    try {
      Response response = await dio.get('$dspace/items/$uuid/bitstreams');

      if (response.statusCode == 200) {
        List jsonLista = response.data;

        for (var item in jsonLista) {
          lista.add(Bitstream.fromJson(item));
        }

        return lista;
      }
    } on Exception catch (e) {
      print(e);
    }

    return lista;
  }

  Future<bool> downloadFile(String uuid, {@required nome}) async {
    try {
      Response response =
          await dio.download('$dspace/bitstreams/$uuid/retrieve', './' + nome);

      if (response.statusCode == 200) {
        return true;
      }
    } on Exception catch (e) {
      print(e);
    }

    return false;
  }
}
