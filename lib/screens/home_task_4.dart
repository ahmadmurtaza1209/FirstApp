import 'dart:ui';

import 'package:first_app/models/task4_model.dart';
import 'package:first_app/widgets/task_4_view.dart';
import 'package:flutter/material.dart';

class HomeTask4 extends StatelessWidget {
  // final Task4Model task;
  HomeTask4({super.key});
  List<Task4Model> list = [
    Task4Model(
        image: "Assets/images/Layer.png",
        name: "Hair Color Treatments",
        code: "AED 162"),
    Task4Model(
        image: "Assets/images/lazy.png", name: "Cut step", code: "AED 50"),
    Task4Model(
        image: "Assets/images/hair.png", name: "short length", code: "AED 100"),
    Task4Model(
        image: "Assets/images/lazy.png", name: "Head massage", code: "AED 250")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Lux Barber",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back_outlined,
          color: Colors.black,
          size: 25,
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 12),
            child: Image.asset(
              "Assets/images/shopping.png",
              height: 28,
              width: 28,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                height: 190,
                width: MediaQuery.of(context).size.width,
                // color: const Color.fromARGB(255, 102, 101, 101),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("Assets/images/pic.jpg"),
                        fit: BoxFit.fill)),
                // child: Image.asset("Assets/images/lazy.png"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1)),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 30, left: 10),
                          child: Image.asset(
                            "Assets/images/logo1.png",
                            height: 80,
                            width: 80,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: const Text(
                            "Luxe Barber",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 50, bottom: 20, top: 30),
                                child: Image.asset(
                                  "Assets/images/whatsapp.png",
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 25, bottom: 20, top: 30),
                                child: const Text(
                                  "+971-000-2145-56",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 50, bottom: 20),
                                child: Image.asset(
                                  "Assets/images/call.png",
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 20, bottom: 20),
                                child: const Text(
                                  "+971-000-2145-56",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 50, bottom: 20),
                                child: Image.asset(
                                  "Assets/images/share.png",
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 20, bottom: 20),
                                child: const Text(
                                  "Map Direction",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Container(
                      width: 140,
                      margin: EdgeInsets.only(right: 20),
                      child: Divider(
                        thickness: 2,
                        color: Color.fromARGB(255, 227, 226, 226),
                      ),
                    ),
                    Text(
                      "Services",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      width: 135,
                      margin: EdgeInsets.only(left: 20),
                      child: Divider(
                        thickness: 2,
                        color: Color.fromARGB(255, 227, 226, 226),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  // padding: EdgeInsets.all(20),
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    Task4Model data2 = list[index];
                    return Task4View(data: data2);
                  }),
            ]),
          ),
        ),
      ),
    );
  }
}
