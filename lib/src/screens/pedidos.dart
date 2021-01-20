import 'package:dsd/src/constants.dart';
import 'package:dsd/src/models/pedido.dart';
import 'package:dsd/src/screens/novo_pedido.dart';
import 'package:dsd/src/screens/pedidos/pedido_detalhes.dart';
import 'package:dsd/src/services/sgp.dart';
import 'package:flutter/material.dart';

class Pedidos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: SgpApi().getPedidos(),
        builder: (context, AsyncSnapshot<List<Pedido>> snapshot) {
          if (snapshot.hasData) {
            List<Pedido> pedidos = snapshot.data;

            if (pedidos.length == 0) {
              return Column(
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
                        'Lista de Pedidos',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    margin: EdgeInsets.all(90.0),
                    padding: EdgeInsets.all(15.0),
                    child: Center(
                      child: Text('Nao ha pedidos'),
                    ),
                  )
                ],
              );
            } else {
              return ListView.builder(
                  itemCount: pedidos.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Column(
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
                                'Lista de Pedidos',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                          ),
                          Divider(),
                          ListTile(
                            title: Text(pedidos[index].servico.designacao),
                            subtitle: Text(getDate(pedidos[index].data)),
                            trailing: Icon(Icons.info_outline),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PedidoDetalhes(
                                          pedido: pedidos[index])));
                            },
                          ),
                        ],
                      );
                    }
                    return ListTile(
                      title: Text(pedidos[index].servico.designacao),
                      subtitle: Text(getDate(pedidos[index].data)),
                      trailing: Icon(Icons.info_outline),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PedidoDetalhes(pedido: pedidos[index])));
                      },
                    );
                  });
            }
          }

          if (snapshot.hasError)
            return Center(
              child: Text('Ocorreu um erro'),
            );

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NovoPedido()));
        },
        backgroundColor: Colors.green[700],
        child: Icon(Icons.add),
      ),
    );
  }
}
