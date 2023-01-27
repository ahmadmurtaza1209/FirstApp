import 'package:first_app/screens/screen_first.dart';
import 'package:flutter/material.dart';

class ScreenThird extends StatefulWidget {
  final String DataSave2;
  const ScreenThird({super.key, required this.DataSave2});

  @override
  State<ScreenThird> createState() => _ScreenThirdState();
}

class _ScreenThirdState extends State<ScreenThird> {
  // final TextEditingController data = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 234, 177, 144),
      appBar: AppBar(
        title: Text(
          "Third Screen",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 4, 59, 131),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const Expanded(child: Center()),
          Container(
            margin: EdgeInsets.all(50),
            child: TextFormField(
              // controller: data,
              decoration: InputDecoration(hintText: "Enter something,"),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ScreenFirst();
              }));
            },
            child: Text(
              "Navigate",
              style: TextStyle(
                  color: Color.fromARGB(255, 4, 59, 131),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Text(widget.DataSave2,
              style: TextStyle(fontSize: 30, color: Colors.black))
        ],
      ),
    );
  }
}
