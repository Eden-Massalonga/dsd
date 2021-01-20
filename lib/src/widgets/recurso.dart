import 'package:flutter/material.dart';
import '../widgets/webpage.dart';

class Recurso extends StatelessWidget {
  Recurso({this.img, this.descricao, this.url});

  final String img;
  final String descricao;
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebPage(
                      url: this.url,
                      descricao: this.descricao,
                    )));
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage(this.img),
            ),
            // Text(this.descricao),
            // Align(
            //   child: RaisedButton(
            //     onPressed: () {},
            //     child: Text('Detalhes'),
            //     color: Theme.of(context).primaryColor,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
