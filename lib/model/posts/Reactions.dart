import 'dart:convert';

Reactions reactionsFromJson(String str) => Reactions.fromJson(json.decode(str));
String reactionsToJson(Reactions data) => json.encode(data.toJson());
class Reactions {
  Reactions({
      this.likes, 
      this.dislikes,});

  Reactions.fromJson(dynamic json) {
    likes = json['likes'];
    dislikes = json['dislikes'];
  }
  num? likes;
  num? dislikes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['likes'] = likes;
    map['dislikes'] = dislikes;
    return map;
  }

}