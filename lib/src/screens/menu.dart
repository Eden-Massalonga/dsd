import 'package:flutter/material.dart';
import 'inicio.dart';
import 'servicos.dart';
import 'pedidos.dart';
import 'contactos.dart';

class Menu extends StatefulWidget {
  Menu();

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _indice = 0;

  void _selecionaPagina(int indice) {
    setState(() {
      _indice = indice;
    });
  }

  List<Widget> _paginas = [Inicio(), Servicos(), Pedidos(), Contactos()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UEM'),
      ),
      body: Container(
        child: _paginas.elementAt(_indice),
      ),
      bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Theme.of(context).backgroundColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: _indice,
          onTap: _selecionaPagina,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Serviços',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: 'Pedidos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              label: 'Contactos',
            ),
          ]),
    );
  }
}
