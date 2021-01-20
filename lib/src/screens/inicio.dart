import 'package:dsd/src/screens/biblioteca/biblioteca_digital.dart';
import 'package:dsd/src/screens/repositorio_digital.dart';
import 'package:flutter/material.dart';
import '../widgets/recurso.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image(
                  image: AssetImage('img/banner.png'),
                  fit: BoxFit.fitWidth,
                ),
                Divider(),
                // SizedBox(
                //   child: Divider(
                //       // color: Colors.grey,
                //       ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(
                    'Objectivo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
//                      backgroundColor: Colors.grey[50],
                    ),
                  ),
                ),
                SizedBox(
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(
                    'Atender aos programas de ensino, pesquisa e extensão no âmbito da UEM, e prestar serviços aos discentes, docentes, investigadores e corpo técnico-administrativo',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                  // child: Divider(),
                  height: 5.0,
                ),
              ],
            ),
          ),
          SizedBox(
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
              'Recursos Digitais',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          SizedBox(
            child: Divider(),
          ),
          Container(
            child: Column(
              children: <Widget>[
//                Recurso(
//                  img: 'img/biblioteca digital.png',
//                  descricao: 'LIBHUB UEM',
//                  url: 'http://libhub.sempertool.dk/',
//                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BibliotecaDigital()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage('img/biblioteca digital.png'),
                        ),
                      ],
                    ),
                  ),
                ),
                Recurso(
                  img: 'img/revista.png',
                  descricao: 'Revista Cientifica da UEM',
                  url: 'http://www.revistacientifica.uem.mz/',
                ),
                Recurso(
                  img: 'img/catalogo.png',
                  descricao: 'Catalogo do SIBUEM',
                  url: 'http://bce.uem.mz/site/php/index.php',
                ),
                Recurso(
                  img: 'img/base de dados.png',
                  descricao: 'Bases de Dados Cientificas',
                  url: 'http://www.dsd.uem.mz/index.php/bases-de-dados',
                ),

                //Repositorios Digitais
                GestureDetector(
                  child: Container(
                    child: Image.asset('img/repositorios.png'),
                    margin: EdgeInsets.only(
                        left: 10.0, top: 10.0, right: 10.0, bottom: 5.0),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RepositorioDigital()));
                  },
                ),
                SizedBox(
                  height: 10.0,
                )
                // FlatButton(
                //   onPressed: () => Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => RepositorioDigital()),
                //   ),
                //   child: Text('Repositorio Digital'),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
