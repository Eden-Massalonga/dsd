import 'package:dsd/src/constants.dart';
import 'package:dsd/src/models/pedido.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PedidoDetalhes extends StatelessWidget {
  final Pedido pedido;

  PedidoDetalhes({this.pedido});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Descricao do Pedido'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 55.0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                pedido.servico.designacao,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Nome: ' + pedido.utente.nome),
          ),
          ListTile(
            title: Text('Vinculo: ' + pedido.utente.vinculo.designacao),
          ),
          ListTile(
            title: Text('Detalhes: ' + pedido.detalhes),
          ),
          ListTile(
            title: Text('Data: ' + getDate(pedido.data)),
          ),
        ],
      ),
    );
  }
}
