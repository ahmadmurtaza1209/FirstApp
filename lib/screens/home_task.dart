import 'package:first_app/models/trips_model.dart';
import 'package:first_app/widgets/recent_trips_item_view_model.dart';
import 'package:flutter/material.dart';

import '../widgets/recent_trips_item_view.dart';

class HomeTask extends StatelessWidget {
  HomeTask({super.key});
  List<TripsModel> tripList = [
    TripsModel(
        image: "Assets/images/Boy.png",
        name: "Netflix Subscription",
        dateTime: "Dec 2, 2022 . 10:20 AM",
        price: "87.00"),
    TripsModel(
        image: "Assets/images/girl.png",
        name: "Netflix Subscription",
        dateTime: "Dec 2, 2022 . 10:20 AM",
        price: "87.00"),
    TripsModel(
        image: "Assets/images/Boy.png",
        name: "Netflix Subscription",
        dateTime: "Dec 2, 2022 . 10:20 AM",
        price: "87.00"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Task "),
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: tripList.length,
          itemBuilder: (BuildContext context, index) {
            TripsModel detail2 = tripList[index];
            return RecentTripsItemViewModel(detail: detail2);

            // RecentTripsItemView(
            //   imagepath: index.isEven

            //       ? "Assets/images/Boy.png"
            //       : "Assets/images/girl.png",
            //   dateTime: index.isEven
            //       ? "Dec 2, 2022 . 10:20 AM"
            //       : "Dec 12, 2002 . 09:15 PM",
            //   name: index.isEven ? "Netflix Subscription" : "Starbucks Coffee",
            //   price: index.isEven ? "87.00" : "157.00",
            // );
          }),
    );
  }
}
