import 'dart:convert';
import 'dart:html';

import 'package:first_app/apis_examples/models/posts_model.dart';
import 'package:first_app/apis_examples/models/users_model.dart';
import 'package:first_app/apis_examples/screens/create_post_screen.dart';
import 'package:first_app/apis_examples/screens/post_detail_screen.dart';
import 'package:first_app/apis_examples/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  final UsersModel data;

  ProfileScreen({
    super.key,
    required this.data,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<PostsModel> PostUserList = [];

  Future<List<PostsModel>> postUser() async {
    Uri uri = Uri.parse(
        "https://jsonplaceholder.typicode.com/posts?userId=${widget.data.id}");
    http.Response response = await http.get(uri);
    var decodeData = jsonDecode(response.body) as List;
    for (int i = 0; i < decodeData.length; i++) {
      PostsModel obj = PostsModel.fromJson(decodeData[i]);
      PostUserList.add(obj);
    }
    return PostUserList;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromARGB(255, 1, 141, 255),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 1, 141, 255),
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          // margin: EdgeInsets.only(left: width * 0.05),

                          height: height * 0.1,
                          width: width * 0.22,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: const Icon(
                            Icons.person_rounded,
                            color: Colors.grey,
                            size: 45,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: height * 0.02),
                          child: Text(
                            widget.data.name,
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: height * 0.009),
                          child: Text(
                            widget.data.email,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: height * 0.1,
                          left: width * 0.02,
                          right: width * 0.02),
                      height: height * 0.5,
                      width: width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                      ),
                      child: Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.only(
                                left: width * 0.04, bottom: height * 0.03),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    top: height * 0.03,
                                  ),
                                  child: const Text(
                                    "Profile",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: height * 0.025),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: const Icon(
                                          Icons.person,
                                          color:
                                              Color.fromARGB(255, 63, 62, 62),
                                          size: 25,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.05,
                                      ),
                                      Container(
                                        child: Text(
                                          widget.data.username,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: height * 0.025),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: const Icon(
                                          Icons.phone,
                                          color:
                                              Color.fromARGB(255, 63, 62, 62),
                                          size: 25,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.05,
                                      ),
                                      Container(
                                        child: Text(
                                          widget.data.phone,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: height * 0.025),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: const Icon(
                                          Icons.email_outlined,
                                          color:
                                              Color.fromARGB(255, 63, 62, 62),
                                          size: 25,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.05,
                                      ),
                                      Container(
                                        child: Text(
                                          widget.data.website,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: height * 0.025),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: const Icon(
                                          Icons.location_on_outlined,
                                          color:
                                              Color.fromARGB(255, 63, 62, 62),
                                          size: 25,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.05,
                                      ),
                                      Container(
                                        child: Text(
                                          "${widget.data.address.street}, ${widget.data.address.suite}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: height * 0.025),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: const Icon(
                                          Icons.location_city_rounded,
                                          color:
                                              Color.fromARGB(255, 63, 62, 62),
                                          size: 25,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.05,
                                      ),
                                      Container(
                                        child: Text(
                                          "${widget.data.address.city}, ${widget.data.address.zipcode}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: height * 0.025),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: const Icon(
                                          Icons.location_searching_rounded,
                                          color:
                                              Color.fromARGB(255, 63, 62, 62),
                                          size: 25,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.05,
                                      ),
                                      Container(
                                        child: Text(
                                          "${widget.data.address.geo.lat}, ${widget.data.address.geo.lng}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: height * 0.025),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: const Icon(
                                          Icons.reduce_capacity_outlined,
                                          color:
                                              Color.fromARGB(255, 63, 62, 62),
                                          size: 25,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.05,
                                      ),
                                      Container(
                                        child: Text(
                                          "${widget.data.company.name}, \n ${widget.data.company.catchPhrase}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: height * 0.025),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: const Icon(
                                          Icons.business_rounded,
                                          color:
                                              Color.fromARGB(255, 63, 62, 62),
                                          size: 25,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.05,
                                      ),
                                      Container(
                                        child: Text(
                                          widget.data.company.bs,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: height * 0.02,
                          left: width * 0.02,
                          right: width * 0.02,
                          bottom: height * 0.02),
                      height: height * 0.5,
                      width: width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CreatePostScreen(
                                        id: widget.data.id,
                                      )));
                            },
                            child: Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(
                                  top: height * 0.03,
                                  left: width * 0.03,
                                  right: width * 0.05),
                              child: const Text(
                                "Create Post",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: height * 0.01,
                                left: width * 0.03,
                                right: width * 0.03),
                            child: const Text(
                              "Posts",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: width * 0.03, right: width * 0.03),
                                  child: FutureBuilder<List<PostsModel>>(
                                      future: postUser(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<List<PostsModel>>
                                              snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.blue,
                                            ),
                                          );
                                        } else if (snapshot.hasData) {
                                          return Container(
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                physics: const ScrollPhysics(),
                                                itemCount: PostUserList.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        index) {
                                                  PostsModel screenData =
                                                      PostUserList[index];
                                                  return Container(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.of(context).push(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            PostDetailScreen(
                                                                              comment: screenData,
                                                                              id: widget.data.id,
                                                                            )));
                                                          },
                                                          child: Container(
                                                            child: Text(
                                                              PostUserList[
                                                                      index]
                                                                  .title,
                                                              style: const TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height * 0.01,
                                                        ),
                                                        Container(
                                                          child: Text(
                                                            PostUserList[index]
                                                                .body,
                                                            style: const TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w200),
                                                          ),
                                                        ),
                                                        Container(
                                                          child: const Divider(
                                                            thickness: 1,
                                                            color:
                                                                Color.fromRGBO(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    0.4),
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
                                        return Container();
                                      })),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
