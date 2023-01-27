import 'dart:convert';

import 'package:first_app/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/post_albums_model.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  List<Postmodel> postList = [];
  List<Postalbumsmodel> albumsList = [];
  Future<http.Response> getPosts() async {
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    http.Response response = await http.get(uri);
    // print("response.statusCode");
    // print(response.statusCode);
    // print("response.body");
    // print(response.body);
    var decodedBody = jsonDecode(response.body) as List;
    // Map<String, dynamic> jsonResponse = {
    //   "userId": 1,
    //   "id": 1,
    //   "title":
    //       "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    //   "body":
    //       "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
    // };
    // Postmodel obj = Postmodel.fromJson(jsonResponse);
    for (int i = 0; i < decodedBody.length; i++) {
      Postmodel obj = Postmodel.fromJson(decodedBody[i]);
      postList.add(obj);
      setState(() {});
    }
    return response;
  }

  Future<http.Response> getAlbums() async {
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/albums");
    http.Response response = await http.get(uri);
    var decodeData = jsonDecode(response.body) as List;
    for (int i = 0; i < decodeData.length; i++) {
      Postalbumsmodel obj1 = Postalbumsmodel.fromJson(decodeData[i]);
      albumsList.add(obj1);
      setState(() {});
    }
    return response;
  }

  Future<http.Response> getPhotos() async {
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    http.Response response = await http.get(uri);
    print("response.statusCode");
    print(response.statusCode);
    print("response.body");
    print(response.body);
    return response;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // var res = getPosts();
    var albums = getAlbums();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: albumsList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: albumsList.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  title: Text(albumsList[index].title),
                  subtitle: Text(albumsList[index].id.toString()),
                );
              }),
    );
  }
}
