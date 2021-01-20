class Vinculo {
  int id;
  String designacao;

  Vinculo({this.id, this.designacao});

  Vinculo.fromJson(Map<String, dynamic> json) {
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
