import 'package:dsd/src/constants.dart';
import 'package:dsd/src/models/bitstream.dart';
import 'package:dsd/src/models/term.dart';
import 'package:dsd/src/services/sgp.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_file/open_file.dart';

class Publicacao extends StatefulWidget {
  Publicacao(this.metadata, {@required this.nome, this.uuid});

  final List<Term> metadata;
  final String nome;
  final String uuid;

  @override
  _PublicacaoState createState() =>
      _PublicacaoState(metadata, nome: nome, uuid: uuid);
}

class _PublicacaoState extends State<Publicacao> {
  _PublicacaoState(this.metadata, {@required this.nome, this.uuid});

  BuildContext scaffoldContext;

  SgpApi api = SgpApi();
  List<Term> metadata;
  String nome;
  String uuid;
  bool isDownloading;
  double downloadPercentage = 0;
  String msg = '';

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
      print('launching...');
    } else {
      throw 'Could not launch $url';
    }
  }

  Column getMetadata() {
    List<Container> lista = [];

    for (Term term in this.metadata) {
      if (term.qualifier != null && term.value != null) {
        if (term.qualifier != 'abstract' &&
            term.qualifier != 'iso' &&
            term.qualifier != 'uri' &&
            term.qualifier != 'sponsorship' &&
            term.qualifier != 'citation') {
          if (term.qualifier == 'accessioned' ||
              term.qualifier == 'available' ||
              term.qualifier == 'issued') {
            lista.add(Container(
              // padding: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.all(5.0),
              alignment: Alignment.centerLeft,
              // decoration: BoxDecoration(
              //   border: Border.all(width: .1),
              //   borderRadius: BorderRadius.circular(2.0),
              // ),
              child: Row(
                children: <Widget>[
                  Text(
                    term.qualifier.toUpperCase() + ': ',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: Text(getDate(term.value)))
                ],
              ),
            ));
          } else {
            lista.add(Container(
              // padding: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.all(5.0),
              alignment: Alignment.centerLeft,
              // decoration: BoxDecoration(
              //   border: Border.all(width: .1),
              //   borderRadius: BorderRadius.circular(2.0),
              // ),
              child: Row(
                children: <Widget>[
                  Text(
                    term.qualifier.toUpperCase() + ': ',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: Text(term.value))
                ],
              ),
            ));
          }
        } else {
          if (term.qualifier != 'uri') {
            lista.add(
              Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(5.0),
                alignment: Alignment.centerLeft,
                // decoration: BoxDecoration(
                //   border: Border.all(width: .1),
                //   borderRadius: BorderRadius.circular(2.0),
                // ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      term.qualifier.toUpperCase() + ': ',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      term.value,
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
            );
          } else {
            lista.add(
              Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(5.0),
                alignment: Alignment.centerLeft,
                // decoration: BoxDecoration(
                //   border: Border.all(width: .1),
                //   borderRadius: BorderRadius.circular(2.0),
                // ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      term.qualifier.toUpperCase() + ': ',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    GestureDetector(
                      child: Text(
                        term.value,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue[500]),
                      ),
                      onTap: () => _launchURL(term.value),
                    )
                  ],
                ),
              ),
            );
          }
        }
      } else {
        if (term.element == 'description') {
          lista.add(
            Container(
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.all(5.0),
              alignment: Alignment.centerLeft,
              // decoration: BoxDecoration(
              //   border: Border.all(width: .1),
              //   borderRadius: BorderRadius.circular(2.0),
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    term.element.toUpperCase() + ': ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    term.value,
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
          );
        } else
          lista.add(Container(
            // padding: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.all(5.0),
            alignment: Alignment.centerLeft,
            // decoration: BoxDecoration(
            //   border: Border.all(width: .1),
            //   borderRadius: BorderRadius.circular(2.0),
            // ),
            child: Row(
              children: <Widget>[
                Text(
                  term.element.toUpperCase() + ': ',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: Text(term.value))
              ],
            ),
          ));
      }
    }
    return Column(
      children: lista,
    );
  }

  Column getFiles(List<Bitstream> files) {
    List<Widget> lista = [];

    // lista.add(Text(
    //   'Ficheiros ',
    //   style: TextStyle(fontWeight: FontWeight.bold),
    // ));

    for (Bitstream file in files) {
      lista.add(Container(
        // padding: EdgeInsets.all(5.0),
        // margin: EdgeInsets.all(5.0),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(3.0),
        //   border: Border.all(width: .1),
        // ),
        child: FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(child: Text(file.name.toString())),
              SizedBox(),
              Icon(
                Icons.file_download,
                color: Colors.blue[600],
              )
            ],
          ),
          onPressed: () async {
            // setState(() {
            //   isDownloading = !isDownloading;
            // });

            var dir = await getExternalStorageDirectory();
            // bool resp = await api.downloadFile(file.uuid,
            //     nome: '${dir.path}/${file.name.toString()}');
            // print('Downloaded: ' +
            //     '${dir.path}/${file.name.toString()} ' +
            //     resp.toString());

            api.dio.download(
              '${api.dspace}/bitstreams/${file.uuid}/retrieve',
              './' + '${dir.path}/${file.name.toString()}',
              // options:
              //     Options(headers: {HttpHeaders.acceptEncodingHeader: "*"}),
              onReceiveProgress: (received, total) {
                var percentagem = received / file.sizeBytes;
                bool terminou;

                if (percentagem != 1.0)
                  terminou = false;
                else {
                  terminou = true;
                  Scaffold.of(scaffoldContext).showSnackBar(SnackBar(
                    content: Text('${dir.path}/${file.name.toString()}'),
                    action: SnackBarAction(
                        textColor: Colors.green,
                        disabledTextColor: Colors.amber,
                        label: 'Abrir',
                        onPressed: () {
                          OpenFile.open('${dir.path}/${file.name.toString()}');
                        }),
                  ));
                }

                // print('Percentagem: ' + percentagem.toStringAsFixed(2));

                setState(() {
                  isDownloading = terminou;
                  downloadPercentage = percentagem;
                  msg = (received / file.sizeBytes * 100).toStringAsFixed(0) +
                      "%";
                });
                // print(total);
              },
            );

            // if (isDownloading == false)
            //   showDialog(
            //     context: context,
            //     builder: (context) => AlertDialog(
            //       // title: Text(''),
            //       content: Text('Transferencia Concluida'),
            //       actions: <Widget>[
            //         FlatButton(
            //           onPressed: () {
            //             Navigator.pop(context);
            //           },
            //           child: Text('OK'),
            //         )
            //       ],
            //     ),
            //   );
          },
        ),
      ));

      // ListTile(
      //   title: Text(file.name.toString()),
      //   trailing: Icon(Icons.file_download),
      // )
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: lista,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.nome),
      ),
      body: Builder(builder: (BuildContext context) {
        scaffoldContext = context;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  nome,
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                  // style:Theme.of(context).textTheme.headline5
                ),
                // Divider(),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'Metadados',
                  style: TextStyle(fontSize: 18.0),
                  // style:Theme.of(context).textTheme.headline5
                ),
                Divider(),
                getMetadata(),
                // Divider(),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Ficheiros',
                  style: TextStyle(fontSize: 18.0),
                  // style: Theme.of(context).textTheme.headline5,
                ),
                Divider(),
                isDownloading == false
                    ? Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Text('Transferindo'),
                            SizedBox(
                              height: 10.0,
                            ),
                            LinearProgressIndicator(
                              value: downloadPercentage,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(msg)
                          ],
                        ),
                      )
                    : Text(''),
                FutureBuilder(
                  future: api.getBitstreams(uuid),
                  builder: (context, AsyncSnapshot<List<Bitstream>> snapshot) {
                    if (snapshot.hasData) return getFiles(snapshot.data);

                    if (snapshot.hasError)
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );

                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
