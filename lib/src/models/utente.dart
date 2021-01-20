import './servico.dart';

class Utente {
  int id;
  String nome;
  String email;
  String comprovativo;
  String createdAt;
  String updatedAt;
  Servico vinculo;

  Utente(
      {this.id,
      this.nome,
      this.email,
      this.comprovativo,
      this.createdAt,
      this.updatedAt,
      this.vinculo});

  Utente.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    comprovativo = json['comprovativo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    vinculo =
        json['vinculo'] != null ? new Servico.fromJson(json['vinculo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['comprovativo'] = this.comprovativo;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.vinculo != null) {
      data['vinculo'] = this.vinculo.toJson();
    }
    return data;
  }
}
