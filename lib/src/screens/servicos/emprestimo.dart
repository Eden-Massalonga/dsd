import 'package:flutter/material.dart';

class Emprestimo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset('img/emprestimo.png'),
            SizedBox(),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'O empréstimo de obras é facultado individualmente a cada utente, para leitura domiciliária. E é direito exclusivo dos utentes internos.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Não serão facultadas para empréstimo domiciliário, obras de referência (dicionários, enciclopédias, índices, revistas de resumo/abstracts, bibliografias e atlas; publicações periódicas/revistas; publicações de consulta corrente; obras em mau estado de conservação; espécies de edições esgotadas; obras que estejam em depósitos/arquivo.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '\u2022 Quantidade de itens/tempo de uso, conforme a categoria:',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    '\u2022 Estudantes de graduação, até 3 obras/7 dias;',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    '\u2022 Estudantes de pós-graduação, até 5 obras/15 dias;',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    '\u2022 Corpo Técnico e Administrativo, até 3 obras/7 dias;',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    '\u2022 Docentes, até 7 obras/30 dias;',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    '\u2022 Investigadores, até 5 obras/15 dias.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
