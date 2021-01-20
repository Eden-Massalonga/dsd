import './utente.dart';
import './servico.dart';

class Pedido {
  int id;
  String data;
  String detalhes;
  Servico servico;
  Utente utente;

  Pedido({this.id, this.data, this.detalhes, this.servico, this.utente});

  Pedido.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    detalhes = json['detalhes'];
    servico =
        json['servico'] != null ? new Servico.fromJson(json['servico']) : null;
    utente =
        json['utente'] != null ? new Utente.fromJson(json['utente']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['data'] = this.data;
    data['detalhes'] = this.detalhes;
    if (this.servico != null) {
      data['servico'] = this.servico.toJson();
    }
    if (this.utente != null) {
      data['utente'] = this.utente.toJson();
    }
    return data;
  }
}
