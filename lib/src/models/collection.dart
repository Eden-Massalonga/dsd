import 'package:dsd/src/models/community.dart';
import 'package:dsd/src/models/item.dart';

class Collection {
  String uuid;
  String name;
  String handle;
  String type;
  List<String> expand;
  String logo;
  Community parentCommunity;
  List<Community> parentCommunityList;
  List<Item> items;
  String license;
  String copyrightText;
  String introductoryText;
  String shortDescription;
  String sidebarText;
  int numberItems;
  String link;

  Collection(
      {this.uuid,
      this.name,
      this.handle,
      this.type,
      this.expand,
      this.logo,
      this.parentCommunity,
      this.parentCommunityList,
      this.items,
      this.license,
      this.copyrightText,
      this.introductoryText,
      this.shortDescription,
      this.sidebarText,
      this.numberItems,
      this.link});

  Collection.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    handle = json['handle'];
    type = json['type'];
    expand = json['expand'].cast<String>();
    logo = json['logo'];
    parentCommunity = json['parentCommunity'];
    if (json['parentCommunityList'] != null) {
      parentCommunityList = new List<Community>();
      json['parentCommunityList'].forEach((v) {
        parentCommunityList.add(new Community.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = new List<Item>();
      json['items'].forEach((v) {
        items.add(new Item.fromJson(v));
      });
    }
    license = json['license'];
    copyrightText = json['copyrightText'];
    introductoryText = json['introductoryText'];
    shortDescription = json['shortDescription'];
    sidebarText = json['sidebarText'];
    numberItems = json['numberItems'];
    link = json['link'];
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
    if (this.parentCommunityList != null) {
      data['parentCommunityList'] =
          this.parentCommunityList.map((v) => v.toJson()).toList();
    }
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    data['license'] = this.license;
    data['copyrightText'] = this.copyrightText;
    data['introductoryText'] = this.introductoryText;
    data['shortDescription'] = this.shortDescription;
    data['sidebarText'] = this.sidebarText;
    data['numberItems'] = this.numberItems;
    data['link'] = this.link;
    return data;
  }
}
