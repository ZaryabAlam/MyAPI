// import 'package:api1/models/comments.dart';
// import 'package:api1/models/photos.dart';
// import 'package:api1/models/posts.dart';
import 'package:http/http.dart' as http;
import 'package:myapi/models/comments.dart';
import 'package:myapi/models/photos.dart';
import 'package:myapi/models/posts.dart';

import '../models/users.dart';

class RemoteService {
  Future<List<Post>> getPosts() async {
    // Future<List<Post>?> getPosts() async{
    var client = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}

class RemoteServiceComment {
  Future<List<Comments>> getComments() async {
    // Future<List<Comments>?> getComments() async{
    var client = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/comments");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return commentsFromJson(json);
    }
  }
}

class RemoteServiceUser {
  Future<List<Users>> getUsers() async {
    // Future<List<Users>?> getUsers() async{
    var client = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return usersFromJson(json);
    }
  }
}

class RemoteServicePhoto {
  Future<List<Photos>> getPhotos() async {
    // Future<List<Photos>?> getPhotos() async {
    var client = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return photosFromJson(json);
    }
  }
}
