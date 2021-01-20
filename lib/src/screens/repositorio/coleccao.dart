import 'package:dsd/src/models/collection.dart';
import 'package:dsd/src/services/sgp.dart';
import 'package:flutter/material.dart';

import 'items.dart';

class Coleccao extends StatefulWidget {
  Coleccao(this.uuid, {this.repositorio, @required this.nome});

  final String uuid;
  final String nome;
  final int repositorio;

  @override
  _ColeccaoState createState() => _ColeccaoState(uuid, nome: nome);
}

class _ColeccaoState extends State<Coleccao> {
  _ColeccaoState(this.uuid, {@required this.nome});

  SgpApi api = SgpApi();
  String uuid;
  String nome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.nome),
      ),
      body: FutureBuilder(
        future: widget.repositorio != null
            ? api.getCollections(this.uuid, repositorio: 1)
            : api.getCollections(this.uuid),
        builder: (context, AsyncSnapshot<List<Collection>> snapshot) {
          if (snapshot.hasData) if (snapshot.data.length == 0) {
            return Center(
              child: Text(
                'Não existem colecções nessa comunidade',
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
                            'Colecções',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.book),
                        title: Text(snapshot.data[index].name),
                        // subtitle: Text(snapshot.data[index].name),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Itens(
                                snapshot.data[index].uuid,
                                nome: snapshot.data[index].name,
                                numberItems:
                                    snapshot.data[index].numberItems.toString(),
                                repositorio:
                                    widget.repositorio != null ? 1 : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                } else {
                  return ListTile(
                    leading: Icon(Icons.book),
                    title: Text(snapshot.data[index].name),
                    // subtitle: Text(snapshot.data[index].name),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Itens(
                            snapshot.data[index].uuid,
                            nome: snapshot.data[index].name,
                            numberItems:
                                snapshot.data[index].numberItems.toString(),
                            repositorio: widget.repositorio != null ? 1 : null,
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
