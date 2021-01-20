import 'package:dsd/src/models/community.dart';
import 'package:dsd/src/screens/repositorio/coleccao.dart';
import 'package:dsd/src/services/sgp.dart';
import 'package:flutter/material.dart';

class Repositorio extends StatefulWidget {
  final int repositorio;

  Repositorio({this.repositorio});

  @override
  _RepositorioState createState() => _RepositorioState();
}

class _RepositorioState extends State<Repositorio> {
  SgpApi api = SgpApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repositorio Digital'),
      ),
      body: FutureBuilder(
        future: widget.repositorio != null
            ? api.getCommunities(repositorio: 1)
            : api.getCommunities(),
        builder: (context, AsyncSnapshot<List<Community>> snapshot) {
          if (snapshot.hasData)
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
                            'Comunidades',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.book),
                        title: Text(snapshot.data[index].name),
                        // subtitle: Text(snapshot.data[index].introductoryText),
                        onTap: () {
                          if (widget.repositorio != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Coleccao(
                                  snapshot.data[index].uuid,
                                  nome: snapshot.data[index].name,
                                  repositorio: 1,
                                ),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Coleccao(
                                  snapshot.data[index].uuid,
                                  nome: snapshot.data[index].name,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  );
                } else {
                  return ListTile(
                    leading: Icon(Icons.book),
                    title: Text(snapshot.data[index].name),
                    // subtitle: Text(snapshot.data[index].introductoryText),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Coleccao(
                            snapshot.data[index].uuid,
                            nome: snapshot.data[index].name,
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            );

          if (snapshot.hasError)
            return Center(
              child: Text(snapshot.error),
            );

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
