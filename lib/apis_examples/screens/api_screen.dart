import 'package:first_app/apis_examples/screens/comments_screen.dart';
import 'package:first_app/apis_examples/screens/photos_screen.dart';
import 'package:first_app/apis_examples/screens/post_list_screen.dart';
import 'package:first_app/apis_examples/screens/todos_Screen.dart';
import 'package:first_app/apis_examples/screens/users_screen.dart';
import 'package:flutter/material.dart';

import 'albums_screen.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  @override
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
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
              size: 30,
            )),
      ),
      body: Container(
        margin: EdgeInsets.only(
            left: width * 0.05,
            right: width * 0.05,
            top: height * 0.02,
            bottom: height * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const Text(
                "Application Programming\nInterface",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: height * 0.06,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PostListScreen()));
              },
              child: Container(
                alignment: Alignment.center,
                height: height * 0.06,
                width: width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: <Color>[
                          Color.fromARGB(255, 255, 253, 252),
                          Color.fromARGB(255, 1, 141, 255)
                        ]),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Posts",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CommentsScreen()));
              },
              child: Container(
                alignment: Alignment.center,
                height: height * 0.06,
                width: width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: <Color>[
                          Color.fromARGB(255, 255, 253, 252),
                          Color.fromARGB(255, 1, 141, 255)
                        ]),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Comments",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AlbumsScreen()));
              },
              child: Container(
                alignment: Alignment.center,
                height: height * 0.06,
                width: width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: <Color>[
                          Color.fromARGB(255, 255, 253, 252),
                          Color.fromARGB(255, 1, 141, 255)
                        ]),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Albums",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PhotosScreen()));
              },
              child: Container(
                alignment: Alignment.center,
                height: height * 0.06,
                width: width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: <Color>[
                          Color.fromARGB(255, 255, 253, 252),
                          Color.fromARGB(255, 1, 141, 255)
                        ]),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Photos",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TodosScreen()));
              },
              child: Container(
                alignment: Alignment.center,
                height: height * 0.06,
                width: width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: <Color>[
                          Color.fromARGB(255, 255, 253, 252),
                          Color.fromARGB(255, 1, 141, 255)
                        ]),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Todos",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => UsersScreen()));
              },
              child: Container(
                alignment: Alignment.center,
                height: height * 0.06,
                width: width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: <Color>[
                          Color.fromARGB(255, 255, 253, 252),
                          Color.fromARGB(255, 1, 141, 255)
                        ]),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Users",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
