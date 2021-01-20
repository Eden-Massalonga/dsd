import 'package:dsd/src/models/collection.dart';
import 'package:dsd/src/models/community.dart';
import 'package:dsd/src/models/term.dart';

class Item {
  String uuid;
  String name;
  String handle;
  String type;
  List<String> expand;
  String lastModified;
  Collection parentCollection;
  List<Collection> parentCollectionList;
  List<Community> parentCommunityList;
  Null bitstreams;
  String withdrawn;
  String archived;
  String link;
  List<Term> metadata;

  Item(
      {this.uuid,
      this.name,
      this.handle,
      this.type,
      this.expand,
      this.lastModified,
      this.parentCollection,
      this.parentCollectionList,
      this.parentCommunityList,
      this.bitstreams,
      this.withdrawn,
      this.archived,
      this.link,
      this.metadata});

  Item.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    handle = json['handle'];
    type = json['type'];
    expand = json['expand'].cast<String>();
    lastModified = json['lastModified'];
    parentCollection = json['parentCollection'];
    parentCollectionList = json['parentCollectionList'];
    parentCommunityList = json['parentCommunityList'];
    bitstreams = json['bitstreams'];
    withdrawn = json['withdrawn'];
    archived = json['archived'];
    link = json['link'];
    if (json['metadata'] != null) {
      metadata = new List<Term>();
      json['metadata'].forEach((v) {
        metadata.add(new Term.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['handle'] = this.handle;
    data['type'] = this.type;
    data['expand'] = this.expand;
    data['lastModified'] = this.lastModified;
    data['parentCollection'] = this.parentCollection;
    data['parentCollectionList'] = this.parentCollectionList;
    data['parentCommunityList'] = this.parentCommunityList;
    data['bitstreams'] = this.bitstreams;
    data['withdrawn'] = this.withdrawn;
    data['archived'] = this.archived;
    data['link'] = this.link;
    data['metadata'] = this.metadata;
    return data;
  }
}
