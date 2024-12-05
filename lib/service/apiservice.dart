import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:snapshot/model/posts/Postapi.dart';
import 'package:snapshot/model/posts/Posts.dart';


class Apiservice{
  final baseurl=("https://dummyjson.com");
  Future<List<Posts>?> fetchposts() async {
    final responce=await http.get(Uri.parse("$baseurl/products"),headers: null);
    if(responce.statusCode>=200&&responce.statusCode<=299){
      var jsonn=jsonDecode(responce.body);
      var res=Postapi.fromJson(jsonn);
      var list=res.posts;
      return list;
    }
    return null;
  }
}