class Bitstream {
  String uuid;
  String name;
  String handle;
  String type;
  List<String> expand;
  String bundleName;
  String description;
  String format;
  String mimeType;
  int sizeBytes;
  String parentObject;
  String retrieveLink;
  CheckSum checkSum;
  int sequenceId;
  String policies;
  String link;

  Bitstream(
      {this.uuid,
      this.name,
      this.handle,
      this.type,
      this.expand,
      this.bundleName,
      this.description,
      this.format,
      this.mimeType,
      this.sizeBytes,
      this.parentObject,
      this.retrieveLink,
      this.checkSum,
      this.sequenceId,
      this.policies,
      this.link});

  Bitstream.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    handle = json['handle'];
    type = json['type'];
    expand = json['expand'].cast<String>();
    bundleName = json['bundleName'];
    description = json['description'];
    format = json['format'];
    mimeType = json['mimeType'];
    sizeBytes = json['sizeBytes'];
    parentObject = json['parentObject'];
    retrieveLink = json['retrieveLink'];
    checkSum = json['checkSum'] != null
        ? new CheckSum.fromJson(json['checkSum'])
        : null;
    sequenceId = json['sequenceId'];
    policies = json['policies'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['handle'] = this.handle;
    data['type'] = this.type;
    data['expand'] = this.expand;
    data['bundleName'] = this.bundleName;
    data['description'] = this.description;
    data['format'] = this.format;
    data['mimeType'] = this.mimeType;
    data['sizeBytes'] = this.sizeBytes;
    data['parentObject'] = this.parentObject;
    data['retrieveLink'] = this.retrieveLink;
    if (this.checkSum != null) {
      data['checkSum'] = this.checkSum.toJson();
    }
    data['sequenceId'] = this.sequenceId;
    data['policies'] = this.policies;
    data['link'] = this.link;
    return data;
  }
}

class CheckSum {
  String value;
  String checkSumAlgorithm;

  CheckSum({this.value, this.checkSumAlgorithm});

  CheckSum.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    checkSumAlgorithm = json['checkSumAlgorithm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['checkSumAlgorithm'] = this.checkSumAlgorithm;
    return data;
  }
}
