import 'package:flutter/material.dart';

class Visita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('img/visita.png'),
            SizedBox(),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Com objectivo de guiar aos utentes na utilização dos espaços das Bibliotecas da UEM e da Biblioteca Central (BCE) em particular e facilitar o acesso as fontes de informação orais, impressas e electrónicas, em geral, nas visitas orientadas se informa sobre: tipo de acervo existente; áreas principais de estudo cobertas pelo acervo; tipos de serviços prestados pela BCE; condições ou requisitos para ser leitor de pleno direito (empréstimo domiciliar); regras básicas do funcionamento da BCE e do SIBUEM; horário de funcionamento; forma  de acesso ao acervo (localização das obras nas estantes); instrumentos de recuperação de informação (catálogos electrónicos); uso de obras de referência e de revistas imprensas e electrónicas; entre outros aspectos que a BCE julgar importantes.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
