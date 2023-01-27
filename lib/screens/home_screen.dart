import 'package:first_app/screens/counter_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 0;
  void increment() {
    count = count + 1;
    setState(() {});
  }

  void decrement() {
    --count;
    setState(() {});
  }

  void reset() {
    count = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Home Screen",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Text(
              "Counter Value : $count",
              style: TextStyle(fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 35,
                  onPressed: increment,
                  icon: Icon(Icons.add_circle),
                  color: Colors.green,
                ),
                IconButton(
                    iconSize: 35,
                    onPressed: decrement,
                    icon: Icon(
                      Icons.remove_circle_rounded,
                      color: Colors.red,
                    )),
                IconButton(
                    iconSize: 35,
                    onPressed: reset,
                    icon: Icon(
                      Icons.restore_outlined,
                      color: Colors.blue,
                    )),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CounterScreen(counterValue: count);
                }));
              },
              child: Text(" Navigate"),
            ),
          ],
        ));
  }
}
