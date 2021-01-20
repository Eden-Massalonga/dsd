class Servico {
  int id;
  String designacao;

  Servico({this.id, this.designacao});

  Servico.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    designacao = json['designacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['designacao'] = this.designacao;
    return data;
  }
}
