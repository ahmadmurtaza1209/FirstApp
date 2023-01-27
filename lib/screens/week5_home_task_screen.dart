import 'dart:math';

import 'package:flutter/material.dart';

class Week5HomeTaskScreen extends StatelessWidget {
  List<Color> boxcolor = [
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.orange,
    Colors.brown,
    Colors.deepPurpleAccent,
    Colors.pinkAccent
  ];
  Week5HomeTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromARGB(255, 177, 204, 227),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(
                left: width * 0.07,
                right: width * 0.07,
                top: height * 0.02,
                bottom: height * 0.02),
            child: Column(
              children: [
                Container(
                  height: height * 0.07,
                  width: width,
                  // color: Colors.amber,
                  child: TextFormField(
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(93, 93, 93, 1), width: 1.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(93, 93, 93, 1), width: 1.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Find Wallpaper...',
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 17),
                        suffixIcon: const Icon(
                          Icons.search_rounded,
                          color: Colors.grey,
                          size: 30,
                        )),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: height * 0.05,
                  width: width,
                  // color: Colors.amber,
                  child: const Text(
                    "Best of the month",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: height * 0.27,
                  width: width,
                  // color: Colors.amber,
                  child: ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: boxcolor.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                              left: width * 0.01,
                              right: width * 0.02,
                              top: height * 0.01,
                              bottom: height * 0.01),
                          height: height * 0.1,
                          width: width * 0.33,
                          decoration: BoxDecoration(
                              color: boxcolor[index],
                              borderRadius: BorderRadius.circular(15)),
                        );
                      }),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: height * 0.05,
                  width: width,
                  // color: Colors.amber,
                  child: const Text(
                    "The Color tone",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: height * 0.089,
                  width: width,
                  // color: Colors.amber,
                  child: ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: boxcolor.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                              left: width * 0.01,
                              right: width * 0.02,
                              top: height * 0.015,
                              bottom: height * 0.01),
                          // height: height * 0.08,
                          width: width * 0.13,
                          decoration: BoxDecoration(
                              color: boxcolor[index],
                              borderRadius: BorderRadius.circular(8)),
                        );
                      }),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: height * 0.05,
                  width: width,
                  // color: Colors.amber,
                  child: const Text(
                    "Categories",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 110,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 12),
                    itemCount: 4,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      return (Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          // left: width * 0.01,
                          // right: width * 0.02,
                          top: height * 0.014,
                          // bottom: height * 0.01
                        ),
                        // width: width * 0.1,
                        // height: height * 0.2,
                        decoration: BoxDecoration(
                            color: boxcolor[index],
                            borderRadius: BorderRadius.circular(15)),
                        child: const Text(
                          "Abstract",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
