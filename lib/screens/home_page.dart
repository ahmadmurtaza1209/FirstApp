import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(top: 10, right: 10),
            height: 20,
            width: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    width: 2, color: Color.fromARGB(255, 206, 201, 201))),
            child: const Icon(
              Icons.settings_outlined,
              color: Colors.black87,
              size: 25,
            ),
          ),
        ],
        leadingWidth: 70,
        leading: Container(
          height: 50,
          padding: const EdgeInsets.only(left: 10, top: 10),
          color: Colors.white,
          child: Image.asset(
            "Assets/images/logo.jpg",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),

          // width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Hello William,",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 6),
                          child: Text(
                            "Your available balance",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          )),
                    ],
                  ),
                  Text(
                    "\$19,200",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  // margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 13),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.swap_horiz,
                            color: Colors.white,
                            size: 35,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Tip",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                      VerticalDivider(
                        thickness: 0.4,
                        indent: 13,
                        endIndent: 13,
                        color: Colors.white,
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.wallet_sharp,
                            color: Colors.white,
                            size: 35,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Top Up",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                      VerticalDivider(
                        thickness: 0.4,
                        indent: 13,
                        endIndent: 13,
                        color: Colors.white,
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.restore,
                            color: Colors.white,
                            size: 35,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "History",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      )
                    ],
                  )),
              // const Expanded(child: Center()),
              Container(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  "Recent Tips",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 16,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 54,
                                  width: 54,
                                  child: Image.asset(
                                    index.isEven
                                        ? "Assets/images/girl.png"
                                        : "Assets/images/Boy.png",
                                    height: 90,
                                    width: 80,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                          index.isEven
                                              ? "Starbucks Coffee"
                                              : "Netflix Subscription",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 10),
                                      child: Text(
                                          index.isEven
                                              ? "Dec 2,2020 . 3:09 PM"
                                              : "Dec 11,2020 . 10:092 AM",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14)),
                                    )
                                  ],
                                ),
                                const Expanded(child: Center()),
                                Text(index.isEven ? "-\$156.00" : "-\$87.00",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18))
                              ],
                            )),
                        Divider(
                          thickness: 0.2,
                          color: Colors.grey,
                        ),
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
