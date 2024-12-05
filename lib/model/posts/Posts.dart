import 'Reactions.dart';
import 'dart:convert';

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));
String postsToJson(Posts data) => json.encode(data.toJson());
class Posts {
  Posts({
      this.id, 
      this.title, 
      this.body, 
      this.tags, 
      this.reactions, 
      this.views, 
      this.userId,});

  Posts.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    reactions = json['reactions'] != null ? Reactions.fromJson(json['reactions']) : null;
    views = json['views'];
    userId = json['userId'];
  }
  num? id;
  String? title;
  String? body;
  List<String>? tags;
  Reactions? reactions;
  num? views;
  num? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    map['tags'] = tags;
    if (reactions != null) {
      map['reactions'] = reactions?.toJson();
    }
    map['views'] = views;
    map['userId'] = userId;
    return map;
  }

}