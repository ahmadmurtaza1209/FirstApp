import 'dart:convert';

import 'package:first_app/apis_examples/models/comments_model.dart';
import 'package:first_app/apis_examples/models/posts_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostDetailScreen extends StatefulWidget {
  final PostsModel comment;
  final int id;
  const PostDetailScreen({super.key, required this.comment, required this.id});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController bodyController = TextEditingController();
  List<CommentsModel> CommentsList = [];
  Future<void> dialoge() async {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
                title: const Text('Comment'),
                content: Form(
                  key: _formKey,
                  child: Container(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return ("Please enter some text");
                        } else {}
                      },
                      controller: bodyController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        hintText: "write comment",
                        hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                actions: [
                  InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        bool status = await addComment();

                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ]));
  }

  Future<bool> addComment() async {
    setState(() {
      isLoading = true;
    });
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/comments");
    Map<String, dynamic> body = {
      "userId": widget.id,
      "body": bodyController.text
    };
    Map<String, String> header = {
      "Content-Type": "application/json; charset=utf-8"
    };

    http.Response response =
        await http.post(uri, body: jsonEncode(body), headers: header);
    setState(() {
      isLoading = false;
    });
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<CommentsModel>> commentUser() async {
    Uri uri = Uri.parse(
        "https://jsonplaceholder.typicode.com/comments?postId=${widget.comment.id}");
    http.Response response = await http.get(uri);
    var decodeData = jsonDecode(response.body) as List;
    for (int i = 0; i < decodeData.length; i++) {
      CommentsModel obj = CommentsModel.fromJson(decodeData[i]);
      CommentsList.add(obj);
    }
    return CommentsList;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
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
          title: const Text(
            "Comments",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  dialoge();
                },
                icon: Icon(
                  Icons.comment_outlined,
                  size: 25,
                  color: Colors.black,
                ))
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: width * 0.03,
                    right: width * 0.03,
                    top: height * 0.02,
                  ),
                  child: Text(
                    widget.comment.title,
                    style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: width * 0.03,
                    right: width * 0.03,
                  ),
                  child: Text(
                    widget.comment.body,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w200),
                  ),
                ),
                Container(
                  child: const Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                        left: width * 0.03,
                        right: width * 0.03,
                        top: height * 0.02,
                        bottom: height * 0.02),
                    child: FutureBuilder<List<CommentsModel>>(
                        future: commentUser(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<CommentsModel>> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child:
                                  CircularProgressIndicator(color: Colors.blue),
                            );
                          } else if (snapshot.hasData) {
                            return Container(
                              child: ListView.builder(
                                  itemCount: CommentsList.length,
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemBuilder: (BuildContext context, index) {
                                    return Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: const Text("Name",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.4))),
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Container(
                                            child: Text(
                                              CommentsList[index].name,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Container(
                                            child: const Text("Email",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.4))),
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Container(
                                            child: Text(
                                                CommentsList[index].email,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Container(
                                            child: const Text("Body",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.4))),
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Container(
                                            child: Text(
                                              CommentsList[index].body,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                          Container(
                                            child: const Divider(
                                              thickness: 1,
                                              color: Colors.grey,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            );
                          } else if (snapshot.hasError) {
                            return const Text("Error occur");
                          }
                          return (Container());
                        })),
              ],
            ),
          ),
        ));
  }
}
