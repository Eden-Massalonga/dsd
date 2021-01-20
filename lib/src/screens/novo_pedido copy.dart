import 'package:dsd/src/models/servico.dart';
import 'package:dsd/src/models/vinculo.dart';
import 'package:flutter/material.dart';
import '../services/sgp.dart';

class NovoPedido extends StatefulWidget {
  @override
  _NovoPedidoState createState() => _NovoPedidoState();
}

class _NovoPedidoState extends State<NovoPedido> {
  SgpApi api = SgpApi();

  Future<bool> disponivel;

  List<Servico> servicos = [];
  Servico servicoSelecionado;

  List<Vinculo> vinculos = [];
  Vinculo vinculoSelecionado;

  bool loading = true;

  @override
  void initState() {
    super.initState();

    // servicos = await api.getServicos();
    // if (servicos.length > 0) servicoSelecionado = servicos[0];

    // getListaServicos();
    // getListaVinculos();
    // setState(() {
    //   loading = false;
    // });
    disponivel = preparaDados();
  }

  Future<bool> preparaDados() async {
    servicos = await api.getServicos();
    if (servicos.length > 0) servicoSelecionado = servicos[0];

    vinculos = await api.getVinculos();
    if (vinculos.length > 0) vinculoSelecionado = vinculos[0];

    return true;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    // await getListaServicos();
    // await getListaVinculos();

    var lServicos = await api.getServicos();
    var servSel;

    if (lServicos.length > 0) servSel = lServicos[0];

    //

    var lVinculos = await api.getVinculos();
    var vincSel;

    if (lVinculos.length > 0) vincSel = lVinculos[0];

    setState(() {
      servicos = lServicos;
      servicoSelecionado = servSel;

      vinculos = lVinculos;
      vinculoSelecionado = vincSel;
      loading = false;
    });
  }

  Future<void> getListaServicos() async {
    var lServicos = await api.getServicos();
    var servSel;

    if (lServicos.length > 0) servSel = lServicos[0];

    setState(() {
      servicos = lServicos;
      servicoSelecionado = servSel;
    });
  }

  Future<void> getListaVinculos() async {
    var lVinculos = await api.getVinculos();
    var vincSel;

    if (lVinculos.length > 0) vincSel = lVinculos[0];

    setState(() {
      vinculos = lVinculos;
      vinculoSelecionado = vincSel;
    });
  }

  List<DropdownMenuItem<Servico>> getMenuServicos() {
    List<DropdownMenuItem<Servico>> menu = [];

    for (Servico opcao in servicos)
      menu.add(DropdownMenuItem(
        child: Text(opcao.designacao),
        value: opcao,
      ));

    return menu;
  }

  List<DropdownMenuItem<Vinculo>> getMenuVinculos() {
    List<DropdownMenuItem<Vinculo>> menu = [];

    for (Vinculo opcao in vinculos)
      menu.add(DropdownMenuItem(
        child: Text(opcao.designacao),
        value: opcao,
      ));

    return menu;
  }

  @override
  Widget build(BuildContext context) {
    if (vinculos.length != 0 && servicos.length != 0)
      setState(() {
        loading = false;
      });

    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Pedido'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            children: <Widget>[
              if (loading)
                Center(
                  child: CircularProgressIndicator(),
                )
              else
                Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Nome'),
                        onSaved: (newValue) {},
                        validator: (value) {},
                        onChanged: (value) {},
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Email'),
                        onSaved: (newValue) {},
                        validator: (value) {},
                        onChanged: (value) {},
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Servico: ',
                            // style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          DropdownButton<Servico>(
                            items: getMenuServicos(),
                            value: servicoSelecionado,
                            onChanged: (value) {
                              print(value);
                            },
                            isExpanded: true,
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Vinculo: ',
                            // style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          DropdownButton<Vinculo>(
                            items: getMenuVinculos(),
                            value: vinculoSelecionado,
                            onChanged: (value) {
                              print(value.designacao);
                            },
                            isExpanded: true,
                          )
                        ],
                      )
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
