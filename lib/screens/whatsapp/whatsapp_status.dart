import 'package:flutter/material.dart';

import '../../models/whatsapp_model.dart';
import '../../widgets/whatsapp_view.dart';

class WhatsAppStatus extends StatelessWidget {
  WhatsAppStatus({super.key});
  List<WhatsAppModel> status = [
    WhatsAppModel(
        image: "Assets/images/img_1.jpeg",
        name: "Ahmad",
        dateTime: "Yesterday"),
    WhatsAppModel(
        image: "Assets/images/img_2.jpeg",
        name: "Muhammad Bilal",
        dateTime: "20/02/2020"),
    WhatsAppModel(
        image: "Assets/images/img_3.jpeg",
        name: "Jameel Ahma",
        dateTime: "18/01/2020"),
    WhatsAppModel(
        image: "Assets/images/img_4.jpeg",
        name: "John",
        dateTime: "01/03/2018"),
    WhatsAppModel(
        image: "Assets/images/img_5.jpeg",
        name: "Jamshed",
        dateTime: "03/05/2016"),
    WhatsAppModel(
        image: "Assets/images/img_6.jpeg", name: "MAT", dateTime: "17/05/2010"),
    WhatsAppModel(
        image: "Assets/images/img_4.jpeg",
        name: "John",
        dateTime: "01/03/2018"),
    WhatsAppModel(
        image: "Assets/images/img_3.jpeg",
        name: "Jameel Ahma",
        dateTime: "18/01/2020"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
          top: MediaQuery.of(context).size.height * 0.03,
          bottom: MediaQuery.of(context).size.height * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            image: AssetImage("Assets/images/Boy.png"),
                            fit: BoxFit.fill))),
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Status",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(padding: EdgeInsets.only(top: 7)),
                      Text(
                        "Tap to add status update",
                        style: TextStyle(
                            fontSize: 19,
                            color: Color.fromARGB(255, 146, 144, 144)),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              child: Text(
                "Recent updates",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 146, 144, 144)),
              ),
            ),
            ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: status.length,
                itemBuilder: (BuildContext context, index) {
                  WhatsAppModel statusData = status[index];
                  return WhatsAppView(
                    detail: statusData,
                  );
                })
          ],
        ),
      ),
    );
  }
}
