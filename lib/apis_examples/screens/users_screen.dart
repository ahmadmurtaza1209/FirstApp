import 'dart:convert';

import 'package:first_app/apis_examples/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../models/posts_model.dart';
import '../models/users_model.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<UsersModel> usersList = [];

  Future<http.Response> getUsers() async {
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/users");
    http.Response response = await http.get(uri);
    var decodeData = jsonDecode(response.body) as List;
    for (int i = 0; i < decodeData.length; i++) {
      UsersModel obj = UsersModel.fromJson(decodeData[i]);
      usersList.add(obj);
      setState(() {});
    }
    return response;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey.shade200,
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(
                left: width * 0.05,
                right: width * 0.05,
                top: height * 0.02,
                bottom: height * 0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: const Text(
                    "Users",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: height * 0.06,
                      width: width * 0.45,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 1, 141, 255),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                      ),
                      child: const Text(
                        "All",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: height * 0.06,
                      width: width * 0.45,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                            topLeft: Radius.circular(0),
                            bottomLeft: Radius.circular(0)),
                      ),
                      child: const Text(
                        "Recent",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                usersList.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue.shade400,
                        ),
                      )
                    : ListView.builder(
                        itemCount: usersList.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (BuildContext context, index) {
                          UsersModel screenData = usersList[index];

                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProfileScreen(
                                        data: screenData,
                                      )));
                            },
                            child: (Container(
                              width: width,
                              height: height * 0.12,
                              margin: EdgeInsets.only(
                                top: height * 0.04,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: width * 0.05),
                                    height: height * 0.07,
                                    width: width * 0.15,
                                    decoration: BoxDecoration(
                                        color: Colors.lightBlue.shade100,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: const Icon(
                                      Icons.person_rounded,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.03,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Text(
                                          usersList[index].name,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: height * 0.01),
                                        child: Text(
                                          usersList[index].email,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )),
                          );
                        })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
