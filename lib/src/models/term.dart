class Term {
  String key;
  String value;
  String language;
  String qualifier;
  String schema;
  String element;

  Term(
      {this.key,
      this.value,
      this.language,
      this.qualifier,
      this.schema,
      this.element});

  Term.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
    language = json['language'];
    qualifier = json['qualifier'];
    schema = json['schema'];
    element = json['element'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    data['language'] = this.language;
    data['qualifier'] = this.qualifier;
    data['schema'] = this.schema;
    data['element'] = this.element;
    return data;
  }
}
