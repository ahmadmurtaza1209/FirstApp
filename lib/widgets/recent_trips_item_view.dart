import 'package:flutter/material.dart';

class RecentTripsItemView extends StatelessWidget {
  final String imagepath;
  final String name;
  final String dateTime;
  final String price;

  const RecentTripsItemView(
      {super.key,
      required this.imagepath,
      required this.name,
      required this.dateTime,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            // color: Colors.yellow,
            child: Image.asset(
              imagepath,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 20,
                  width: 200,
                  padding: EdgeInsets.only(left: 20),
                  // color: Colors.blue,
                  child: Text(
                    name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 20,
                  width: 200,
                  padding: EdgeInsets.only(left: 20),
                  // color: Colors.orange,
                  child: Text(dateTime),
                )
              ],
            ),
          ),
          Container(
            height: 30,
            width: 70,
            // color: Colors.black,
            child: Text(
              "-\$$price",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
