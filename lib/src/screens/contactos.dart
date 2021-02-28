import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contactos extends StatelessWidget {
  Contactos();

  _launchURL() async {
    const url =
        'https://www.google.com/maps/place/Biblioteca+Central+Braz%C3%A3o+Mazula/@-25.9521498,32.6013714,17z/data=!4m12!1m6!3m5!1s0x1ee69a4eb97f1a8f:0xa2740b06f55a4873!2sUniversidade+Eduardo+Mondlane!8m2!3d-25.9521498!4d32.6035601!3m4!1s0x0:0xe747a4631a9b262f!8m2!3d-25.9515355!4d32.6007003';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchWebSite(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _ligar(String numero) async {
    String url = 'tel:$numero';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _enviarEmail(String email) async {
    String url = 'mailto:$email';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('img/biblioteca.jpg'),
              )),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Localização',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Divider(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Av. Julius Nyerere - Campus Principal, 3453',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                  FlatButton.icon(
                    textColor: Colors.green[700],
                    onPressed: _launchURL,
                    icon: Icon(Icons.map),
                    label: Text(
                      'Ver no Mapa',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    height: 20.0,
                  ),
                  Text(
                    'Contactos',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Divider(
                    height: 20.0,
                  ),
                  ListTile(
                    title: Text('21 49 00 09'),
                    trailing: Text(
                      'Ligar',
                      style: TextStyle(
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(Icons.phone),
                    onTap: () async {
                      await _ligar('21490009');
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text('82 35 28 267'),
                    leading: Icon(Icons.phone),
                    onTap: () async {
                      await _ligar('823528267');
                    },
                    trailing: Text(
                      'Ligar',
                      style: TextStyle(
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('84 38 82 231'),
                    leading: Icon(Icons.phone),
                    onTap: () async {
                      await _ligar('843882231');
                    },
                    trailing: Text(
                      'Ligar',
                      style: TextStyle(
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('dsd@uem.mz'),
                    leading: Icon(Icons.email),
                    onTap: () async {
                      await _enviarEmail('dsd@uem.mz');
                    },
                    trailing: Text(
                      'Enviar',
                      style: TextStyle(
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('www.dsd.uem.mz'),
                    leading: Icon(Icons.http),
                    onTap: () async {
                      await _launchWebSite('http://www.dsd.uem.mz');
                    },
                    trailing: Text(
                      'Abrir',
                      style: TextStyle(
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold),
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
