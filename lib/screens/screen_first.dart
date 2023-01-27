import 'package:first_app/screens/screen_second.dart';
import 'package:flutter/material.dart';

class ScreenFirst extends StatefulWidget {
  const ScreenFirst({super.key});

  @override
  State<ScreenFirst> createState() => _ScreenFirstState();
}

class _ScreenFirstState extends State<ScreenFirst> {
  final TextEditingController data = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 234, 177, 144),
      appBar: AppBar(
        title: Text(
          "First Screen",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 55, 0),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const Expanded(child: Center()),
          Container(
            margin: EdgeInsets.all(50),
            child: TextFormField(
              controller: data,
              decoration: InputDecoration(hintText: "Enter something,"),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ScreenSecond(DataSave: data.text);
              }));
            },
            child: Text(
              "Navigate",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 55, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}
