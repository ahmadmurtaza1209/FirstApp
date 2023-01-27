import 'dart:convert';

import 'package:first_app/apis_examples/models/posts_model.dart';
import 'package:first_app/apis_examples/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreatePostScreen extends StatefulWidget {
  final int id;

  const CreatePostScreen({super.key, required this.id});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  Future<bool> createPost() async {
    setState(() {
      isLoading = true;
    });
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    Map<String, dynamic> body = {
      "userId": widget.id,
      "title": titleController.text,
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

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
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
          "Create Post",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty || value == null) {
                    return ("Please enter some text");
                  } else {}
                },
                controller: titleController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  hintText: "Tittle",
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
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
                  hintText: "Body",
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            InkWell(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  bool status = await createPost();
                  if (status) {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                                title: const Text('Successs'),
                                content: const Text(
                                    "Your post is submit successfully!"),
                                actions: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      "okay",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ]));
                  } else {}
                }
              },
              child: isLoading
                  ? const CircularProgressIndicator()
                  : Container(
                      height: height * 0.07,
                      margin: EdgeInsets.only(
                          left: width * 0.05, right: width * 0.05),
                      alignment: Alignment.center,
                      child: const Text(
                        "Create Post",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      color: Colors.blueGrey,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
