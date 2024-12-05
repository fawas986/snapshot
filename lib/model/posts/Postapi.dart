import 'Posts.dart';
import 'dart:convert';

Postapi postapiFromJson(String str) => Postapi.fromJson(json.decode(str));
String postapiToJson(Postapi data) => json.encode(data.toJson());
class Postapi {
  Postapi({
      this.posts, 
      this.total, 
      this.skip, 
      this.limit,});

  Postapi.fromJson(dynamic json) {
    if (json['posts'] != null) {
      posts = [];
      json['posts'].forEach((v) {
        posts?.add(Posts.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
  List<Posts>? posts;
  num? total;
  num? skip;
  num? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (posts != null) {
      map['posts'] = posts?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['skip'] = skip;
    map['limit'] = limit;
    return map;
  }

}