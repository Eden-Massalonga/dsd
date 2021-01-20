import 'package:dsd/src/models/collection.dart';

class Community {
  String uuid;
  String name;
  String handle;
  String type;
  List<String> expand;
  Null logo;
  Community parentCommunity;
  String copyrightText;
  String introductoryText;
  String shortDescription;
  String sidebarText;
  int countItems;
  List<Collection> collections;
  String link;
  List<Community> subcommunities;

  Community(
      {this.uuid,
      this.name,
      this.handle,
      this.type,
      this.expand,
      this.logo,
      this.parentCommunity,
      this.copyrightText,
      this.introductoryText,
      this.shortDescription,
      this.sidebarText,
      this.countItems,
      this.collections,
      this.link,
      this.subcommunities});

  Community.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    handle = json['handle'];
    type = json['type'];
    expand = json['expand'].cast<String>();
    logo = json['logo'];
    parentCommunity = json['parentCommunity'];
    copyrightText = json['copyrightText'];
    introductoryText = json['introductoryText'];
    shortDescription = json['shortDescription'];
    sidebarText = json['sidebarText'];
    countItems = json['countItems'];
    if (json['collections'] != null) {
      collections = new List<Collection>();
      json['collections'].forEach((v) {
        collections.add(new Collection.fromJson(v));
      });
    }
    link = json['link'];
    if (json['subcommunities'] != null) {
      subcommunities = new List<Community>();
      json['subcommunities'].forEach((v) {
        subcommunities.add(new Community.fromJson(v));
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
    data['logo'] = this.logo;
    data['parentCommunity'] = this.parentCommunity;
    data['copyrightText'] = this.copyrightText;
    data['introductoryText'] = this.introductoryText;
    data['shortDescription'] = this.shortDescription;
    data['sidebarText'] = this.sidebarText;
    data['countItems'] = this.countItems;
    if (this.collections != null) {
      data['collections'] = this.collections.map((v) => v.toJson()).toList();
    }
    data['link'] = this.link;
    if (this.subcommunities != null) {
      data['subcommunities'] =
          this.subcommunities.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
