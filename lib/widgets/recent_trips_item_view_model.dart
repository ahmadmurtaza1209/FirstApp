import 'package:first_app/models/trips_model.dart';
import 'package:flutter/material.dart';

class RecentTripsItemViewModel extends StatelessWidget {
  final TripsModel detail;

  const RecentTripsItemViewModel({super.key, required this.detail});

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
              detail.image,
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
                    detail.name,
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
                  child: Text(detail.dateTime),
                )
              ],
            ),
          ),
          Container(
            height: 30,
            width: 70,
            // color: Colors.black,
            child: Text(
              detail.price,
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
