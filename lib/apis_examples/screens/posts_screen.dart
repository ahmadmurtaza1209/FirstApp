import 'dart:convert';

import 'package:first_app/apis_examples/models/posts_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  Future<List<PostsModel>> getPosts() async {
    List<PostsModel> postsList = [];
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    http.Response response = await http.get(uri);
    var decodeData = jsonDecode(response.body) as List;
    postsList = List<PostsModel>.from(
        decodeData.map((json) => PostsModel.fromJson(json))).toList();

    return postsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
              size: 30,
            )),
      ),
      body: FutureBuilder<List<PostsModel>>(
          future: getPosts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<PostsModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    PostsModel screenData = snapshot.data![index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          screenData.id.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          screenData.title,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          screenData.body,
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("Error");
            }
            return Container();
          }),
    );
  }
}
