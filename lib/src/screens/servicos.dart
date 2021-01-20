import 'package:dsd/src/screens/servicos/acesso.dart';
import 'package:dsd/src/screens/servicos/copia.dart';
import 'package:dsd/src/screens/servicos/emprestimo.dart';
import 'package:dsd/src/screens/servicos/visita.dart';
import 'package:flutter/material.dart';

class Servicos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // padding: EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
//          SizedBox(
//            child: Divider(),
//          ),
//          Padding(
//            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//            child: Text(
//              'Serviços Oferecidos',
//              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
//            ),
//          ),
//          SizedBox(
//            child: Divider(),
//          ),
          //
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 55.0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Serviços Oferecidos',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
          ),
          Divider(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Consulte os detalhes e condições de cada serviço clicando sobre as imagens.',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          GestureDetector(
            child: Container(
              child: Image.asset('img/emprestimo.png'),
              margin: EdgeInsets.only(
                  left: 10.0, top: 10.0, right: 10.0, bottom: 5.0),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Emprestimo()));
            },
          ),
          GestureDetector(
            child: Container(
              child: Image.asset('img/visita.png'),
              margin: EdgeInsets.only(
                  left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Visita()));
            },
          ),
          GestureDetector(
            child: Container(
              child: Image.asset('img/pedido.png'),
              margin: EdgeInsets.only(
                  left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Copia()));
            },
          ),
          GestureDetector(
            child: Container(
              child: Image.asset('img/remoto.png'),
              margin: EdgeInsets.only(
                  left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Acesso()));
            },
          ),
        ],
      ),
    );
  }
}
