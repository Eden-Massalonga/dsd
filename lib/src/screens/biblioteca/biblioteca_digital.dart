import 'package:dsd/src/services/sgp.dart';
import 'package:dsd/src/widgets/webpage.dart';
import 'package:flutter/material.dart';

class BibliotecaDigital extends StatefulWidget {
  @override
  _BibliotecaDigitalState createState() => _BibliotecaDigitalState();
}

class _BibliotecaDigitalState extends State<BibliotecaDigital> {
  void entrar(String ip) {
    if (ip != '196.3.98.6') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebPage(
                    url:
                        'http://libhub.sempertool.dk/authentication/uem?url=http://libhub.sempertool.dk',
                    descricao: 'LibHub UEM',
                  )));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebPage(
                    url: 'http://libhub.sempertool.dk/',
                    descricao: 'LibHub UEM',
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biblioteca Digital'),
      ),
      body: Column(
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'A biblioteca digital pode ser usada com a rede da UEM (Intranet) ou por acesso remoto (Internet). O acesso pela rede da UEM é feito sem restrição, enquanto que para fazer o acesso remoto é necessário ter o usuário e senha disponibilizados pela DSD. Solicite as credencias na secção de pedidos.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Aceda a Biblioteca digital pela :'),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WebPage(
                                        url: 'http://libhub.sempertool.dk/',
                                        descricao: 'LibHub UEM',
                                      )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Intranet',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15.0,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      Text('ou'),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WebPage(
                                        url:
                                            'http://libhub.sempertool.dk/authentication/uem?url=http://libhub.sempertool.dk',
                                        descricao: 'LibHub UEM',
                                      )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Internet',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15.0,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
//                  FlatButton(
//                    onPressed: () {},
//                    child: Text('Entrar'),
//                  )
                  FutureBuilder(
                    future: SgpApi().getIP(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return FlatButton(
                          onPressed: () {
                            entrar(snapshot.data);
                          },
                          child: Text('Entrar'),
                        );

                      if (snapshot.hasError)
                        return Center(
                          child: Text(
                              'Nao foi possivel identificar o seu endereco IP'),
                        );

                      return LinearProgressIndicator();
                    },
                  )
                ],
              ),
            ),
          ]),
    );
  }
}
