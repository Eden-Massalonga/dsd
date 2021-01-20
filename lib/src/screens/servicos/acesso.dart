import 'package:flutter/material.dart';

class Acesso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('img/remoto.png'),
            SizedBox(),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Revistas e Livros Electrónicos disponíveis por Subscrição:',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'As revistas e livros electrónicos subscritos pela UEM encontram-se integradas e disponíveis numa única interface de busca no Portal LibHub, acessível pelo Website da Direcção dos Serviços de Documentação, no Biblioteca Digital.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'O Portal LibHub (Biblioteca Digital da UEM) está acessível via Intranet da UEM ou via Acesso Remoto, que requer cadastro prévio e exclusivamente a membros da comunidade da UEM. Os dados para autenticação remota devem ser solicitada no Departamento de Gestão de Informação Digital, na Direcção dos Serviços de Documentação, Edifício da Biblioteca Central Brazão Mazula, ou por email: bce.digital@uem.mz, mediante apresentação de copia do Cartão de Estudante (para estudantes), e documento que comprova vínculo institucional para Docentes e CTA.',
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
