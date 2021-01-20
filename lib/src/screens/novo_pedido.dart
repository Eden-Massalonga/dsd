import 'package:dsd/src/models/servico.dart';
import 'package:dsd/src/models/vinculo.dart';
import 'package:flutter/material.dart';
import '../services/sgp.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';

class NovoPedido extends StatefulWidget {
  @override
  _NovoPedidoState createState() => _NovoPedidoState();
}

class _NovoPedidoState extends State<NovoPedido> {
  SgpApi api = SgpApi();

  final ImagePicker _picker = ImagePicker();

  File _comprovativo;

  String _comprovativoPath;

  getComprovativoPath() {
    if (_comprovativo != null) _comprovativoPath = _comprovativo.path;

    setState(() {
      _comprovativoPath = _comprovativoPath;
    });
  }

  Future<bool> disponivel;

  String nome;
  String email;
  String detalhes;

  List<Servico> servicos = [];
  Servico servicoSelecionado;

  List<Vinculo> vinculos = [];
  Vinculo vinculoSelecionado;

  bool loading = true;

  Future getImageFromCamera() async {
    PickedFile pickedFile = await _picker.getImage(source: ImageSource.camera);

    setState(() {
      _comprovativo = File(pickedFile.path);
    });
  }

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

    nome = await api.getKey('nome');
//    print('Nome: ' + nome);
    email = await api.getEmail();

    return true;
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
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Pedido'),
      ),
      body: FutureBuilder(
        future: disponivel,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            initialValue: nome,
                            decoration: InputDecoration(labelText: 'Nome'),
                            onSaved: (newValue) {
                              nome = newValue;
                            },
                            validator: (value) {
                              if (value.length < 3)
                                return 'O nome deve ter mais de 3 caracteres';
                              return null;
                            },
                            onChanged: (value) {
                              nome = value;
                            },
                          ),
                          TextFormField(
                            initialValue: email,
                            decoration: InputDecoration(labelText: 'Email'),
                            onSaved: (newValue) {
                              email = newValue;
                            },
                            validator: (value) {
                              if (value.length < 3)
                                return 'O email deve ter mais de 3 caracteres';
                              return null;
                            },
                            onChanged: (value) {
                              email = value;
                            },
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
                              Expanded(
                                child: DropdownButton<Servico>(
                                  items: getMenuServicos(),
                                  value: servicoSelecionado,
                                  onChanged: (value) {
                                    setState(() {
                                      servicoSelecionado = value;
                                    });
                                  },
                                  isExpanded: true,
                                ),
                              )
                            ],
                          ),
                          TextFormField(
                            initialValue: detalhes,
                            decoration: InputDecoration(labelText: 'Detalhes'),
                            onSaved: (newValue) {
                              detalhes = newValue;
                            },
                            validator: (value) {
                              if (value.length < 3)
                                return 'Descreva as razoes pelas quais solicita o servico';
                              return null;
                            },
                            onChanged: (value) {
                              detalhes = value;
                            },
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
                              Expanded(
                                child: DropdownButton<Vinculo>(
                                  items: getMenuVinculos(),
                                  value: vinculoSelecionado,
                                  onChanged: (value) {
                                    setState(() {
                                      vinculoSelecionado = value;
                                    });
                                  },
                                  isExpanded: true,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text('Comprovativo: '),
                              IconButton(
                                icon: Icon(Icons.insert_drive_file),
                                onPressed: () async {
                                  File comprovativo = await FilePicker.getFile(
                                    type: FileType.custom,
//                                    allowedExtensions: ['.doc', '.docx', '.pdf', '.jpg', '.png']
                                  );

                                  setState(() {
                                    _comprovativo = comprovativo;
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.camera_alt),
                                onPressed: () async {
                                  await getImageFromCamera();
                                },
                              ),
                            ],
                          ),
                          _comprovativo != null
                              ? ListTile(
                                  title: Text(
                                    basename(_comprovativo.path),
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _comprovativo = null;
                                      });
                                    },
                                  ),
                                )
                              : Container(
                                  child: Text('Nao apresentou o comprovativo'),
                                )
                        ],
                      ),
                    ),

                    //
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();

                          getComprovativoPath();

                          bool resp = await api.postPedidos(
                              nome,
                              email,
                              servicoSelecionado.id,
                              vinculoSelecionado.id,
                              detalhes,
                              _comprovativoPath);

                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Mensagem'),
                              content: resp
                                  ? Text('Pedido Enviado')
                                  : Text('Ocorreu um erro. Tente Novamente!'),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      if (resp) {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      } else
                                        Navigator.pop(context);
                                    },
                                    child: Text('OK'))
                              ],
                            ),
                          );
                        }
                      },
                      child: Text('Enviar'),
                    )
                  ],
                ),
              ),
            );
          }

          if (snapshot.hasError)
            return Container(
              child: Center(
                child: Text(snapshot.error),
              ),
            );

          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
