import 'package:flutter/material.dart';

class Copia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('img/pedido.png'),
            SizedBox(),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'O serviço de pedido de cópia de documentos permite que sejam solicitadas cópias de artigos de periódicos, partes de livros, monografias, dissertações, teses e documentos técnicos, que são reproduzidos pela BCE, em estrita observância dos direitos de autor.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'A resposta aos pedidos será sempre enviada por email, sendo os documentos digitalizados e enviados em formato pdf.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'O prazo de entrega das cópias solicitadas dependerá do volume de pedidos e da disponibilidade dos documentos nos acervos da BCE, ou da agilidade de atendimento da Biblioteca fornecedora das cópias, nos casos em que os documentos serão solicitados a outras Bibliotecas dentro ou fora do país.',
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
