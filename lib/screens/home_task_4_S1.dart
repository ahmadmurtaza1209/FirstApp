import 'package:first_app/models/task4_model.dart';
import 'package:flutter/material.dart';

class HomeTask4S1 extends StatelessWidget {
  final Task4Model detail;
  const HomeTask4S1({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                height: 400,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 20, top: 20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(detail.image), fit: BoxFit.fill)),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "....",
                    style: TextStyle(
                        color: Colors.grey, fontSize: 80, letterSpacing: -5),
                  ),
                  const Text(
                    ".",
                    style: TextStyle(
                        color: Colors.black, fontSize: 80, letterSpacing: -5),
                  )
                ],
              ),
              const Divider(
                thickness: 2,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 5),
                child: const Icon(
                  Icons.favorite_border_sharp,
                  color: Colors.red,
                  size: 30,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 7),
                child: const Text(
                  "Lux barber",
                  style: TextStyle(color: Colors.grey, fontSize: 17),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 7),
                child: Text(
                  detail.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 5),
                child: const Text(
                  "Multi shade shine",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 8, left: 30, right: 30),
                child: const Text(
                  "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Expanded(child: Center()),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 70,
                    width: 155,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset:
                              const Offset(2, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      detail.code,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 70,
                    width: 227,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                          Color.fromARGB(255, 229, 33, 19),
                          Color.fromARGB(255, 255, 170, 42)
                        ])),
                    child: const Text(
                      "Book This",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
