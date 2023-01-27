import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  final int counterValue;

  const CounterScreen({super.key, required this.counterValue});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  String myValue = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    multiplyFun();
  }

  void multiplyFun() {
    myValue = "${widget.counterValue * 2}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 14, 3, 40),
          leading: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Back",
                style: TextStyle(color: Colors.white),
              )),
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Counter Screen",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Text(
              "Counter Value ",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              myValue,
              style: TextStyle(fontSize: 50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 35,
                  onPressed: () {},
                  icon: Icon(Icons.add_circle),
                  color: Colors.green,
                ),
                IconButton(
                    iconSize: 35,
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove_circle_rounded,
                      color: Colors.red,
                    )),
              ],
            )
          ],
        ));
    ;
  }
}
