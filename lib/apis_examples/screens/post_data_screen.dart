import 'dart:convert';

import 'package:first_app/apis_examples/models/posts_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostDataScreen extends StatefulWidget {
  const PostDataScreen({super.key});

  @override
  State<PostDataScreen> createState() => _PostDataScreenState();
}

class _PostDataScreenState extends State<PostDataScreen> {
  Future<PostsModel> postData() async {
    Map<String, dynamic> data = {
      "userId": 123,
      "title": "flutter Developer",
      "body": "Exd",
    };
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    http.Response response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));

    PostsModel post = PostsModel.fromJson(jsonDecode(response.body));
    return post;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: postData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                return Container(
                  child: Column(
                    children: [
                      Text(
                        snapshot.data!.userId.toString(),
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                      Text(
                        snapshot.data!.body,
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                      Text(
                        snapshot.data.title,
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("errorr");
              }

              return Container();
            }),
      ),
    );
  }
}
