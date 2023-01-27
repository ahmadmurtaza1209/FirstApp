import 'dart:convert';

import 'package:first_app/apis_examples/models/comments_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  Future<List<CommentsModel>> getComments() async {
    List<CommentsModel> commentsList = [];
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/comments");
    http.Response response = await http.get(uri);
    var decodeData = jsonDecode(response.body) as List;
    commentsList = List<CommentsModel>.from(
        decodeData.map((json) => CommentsModel.fromJson(json))).toList();

    return commentsList;
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
      body: FutureBuilder<List<CommentsModel>>(
          future: getComments(),
          builder: (BuildContext context,
              AsyncSnapshot<List<CommentsModel>> snapshot) {
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
                    CommentsModel screenData = snapshot.data![index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(screenData.postId.toString(),
                            style:
                                TextStyle(fontSize: 14, color: Colors.black)),
                        Text(
                          screenData.name,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(screenData.email,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Text(screenData.body,
                            style:
                                TextStyle(fontSize: 14, color: Colors.black)),
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
