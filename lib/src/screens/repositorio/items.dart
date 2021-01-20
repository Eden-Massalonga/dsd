import 'package:dsd/src/models/item.dart';
import 'package:dsd/src/models/term.dart';
import 'package:dsd/src/screens/repositorio/publicacao.dart';
import 'package:dsd/src/services/sgp.dart';
import 'package:flutter/material.dart';

class Itens extends StatefulWidget {
  Itens(this.uuid, {this.repositorio, @required this.nome, this.numberItems});

  final String uuid;
  final String nome;
  final String numberItems;
  final int repositorio;

  @override
  _ItensState createState() =>
      _ItensState(uuid, nome: this.nome, numberItems: numberItems);
}

class _ItensState extends State<Itens> {
  _ItensState(this.uuid, {@required this.nome, this.numberItems});

  SgpApi api = SgpApi();
  String uuid;
  String nome;
  String numberItems;

  Text getAuthor(List<Term> metadata) {
    for (Term term in metadata) {
      if (term.qualifier == 'author') return Text('Autor: ' + term.value);
    }
    if (metadata.first != null) {
      if (metadata.first.qualifier != null)
        return Text(metadata.first.qualifier + ': ' + metadata.first.value);
      else
        return Text(metadata.first.value);
    } else
      return Text('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.nome),
      ),
      body: FutureBuilder(
        future: widget.repositorio != null
            ? api.getItems(uuid, repositorio: 1)
            : api.getItems(uuid),
        builder: (context, AsyncSnapshot<List<Item>> snapshot) {
          if (snapshot.hasData) if (snapshot.data.length == 0) {
            return Center(
              child: Text(
                'Não existem publicações nessa colecção',
                style: TextStyle(fontSize: 16.0),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 55.0,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Publicações',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text('Total: ${this.numberItems}'),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.insert_drive_file),
                        title: Text(snapshot.data[index].name),
                        subtitle: getAuthor(snapshot.data[index].metadata),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Publicacao(
                                snapshot.data[index].metadata,
                                nome: snapshot.data[index].name,
                                uuid: snapshot.data[index].uuid,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                } else {
                  return ListTile(
                    leading: Icon(Icons.insert_drive_file),
                    title: Text(snapshot.data[index].name),
                    subtitle: getAuthor(snapshot.data[index].metadata),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Publicacao(
                            snapshot.data[index].metadata,
                            nome: snapshot.data[index].name,
                            uuid: snapshot.data[index].uuid,
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            );
          }

          if (snapshot.hasError)
            return Center(
              child: Text(snapshot.error.toString()),
            );

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
