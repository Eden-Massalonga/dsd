import 'package:dsd/src/screens/repositorio.dart';
import 'package:dsd/src/widgets/webpage.dart';
import 'package:flutter/material.dart';

class RepositorioDigital extends StatefulWidget {
  @override
  _RepositorioDigitalState createState() => _RepositorioDigitalState();
}

class _RepositorioDigitalState extends State<RepositorioDigital> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repositorio Institucional'),
      ),
      body: ListView(
        children: <Widget>[
          Column(
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
                      'Detalhes',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                  child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Os repositórios institucionais têm a finalidade específica de fornecer acesso aos trabalhos de fim de curso: monografia, dissertações e teses, bem como artigos e trechos de livros ou livros completos',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        'Clique no repositorio que deseja aceder :',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ]),
          ListTile(
            title: Text('Monografias'),
            leading: Icon(Icons.storage),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WebPage(
                            url: 'http://monografias.uem.mz/',
                            descricao: 'RIUEM Monografias',
                          )));
            },
          ),
          ListTile(
            title: Text('Publicacoes Cientificas'),
            leading: Icon(Icons.storage),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WebPage(
                            url: 'http://www.repositorio.uem.mz/',
                            descricao: 'RIUEM Publicacoes Cientificas',
                          )));
            },
          ),
          ListTile(
            title: Text('DSPACE 6 DEMO API'),
            leading: Icon(Icons.storage),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Repositorio(),
                )),
          ),
          ListTile(
            title: Text('DSPACE LOCAL - OAI-PMH'),
            leading: Icon(Icons.storage),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Repositorio(
                    repositorio: 1,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
