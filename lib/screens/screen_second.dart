import 'package:first_app/screens/screen_third.dart';
import 'package:flutter/material.dart';

class ScreenSecond extends StatefulWidget {
  final String DataSave;
  const ScreenSecond({super.key, required this.DataSave});

  @override
  State<ScreenSecond> createState() => _ScreenSecondState();
}

class _ScreenSecondState extends State<ScreenSecond> {
  final TextEditingController data1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 234, 177, 144),
      appBar: AppBar(
        title: Text(
          "Second Screen",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 19, 90, 38),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const Expanded(child: Center()),
          Container(
            margin: const EdgeInsets.all(50),
            child: TextFormField(
              controller: data1,
              decoration: const InputDecoration(hintText: "Enter something,"),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ScreenThird(
                  DataSave2: "${widget.DataSave}" "${data1.text}",
                );
              }));
            },
            child: const Text(
              "Navigate",
              style: TextStyle(
                  color: Color.fromARGB(255, 19, 90, 38),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Text(
            widget.DataSave,
            style: const TextStyle(fontSize: 30, color: Colors.black),
          )
        ],
      ),
    );
  }
}
