import 'package:flutter/material.dart';

import '../../models/whatsapp_model.dart';
import '../../widgets/whatsapp_view.dart';

class WhatsAppCall extends StatelessWidget {
  WhatsAppCall({super.key});
  List<WhatsAppModel> call = [
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
          left: MediaQuery.of(context).size.width * 0.03,
          right: MediaQuery.of(context).size.width * 0.01,
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
                      color: Color.fromARGB(250, 18, 140, 126)),
                  child: Icon(
                    Icons.link_sharp,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create call link",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(padding: EdgeInsets.only(top: 7)),
                      Text(
                        "Share a link for your WhatsApp call",
                        style: TextStyle(
                            fontSize: 15,
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
                "Recent",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 146, 144, 144)),
              ),
            ),
            ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: call.length,
                itemBuilder: (BuildContext context, index) {
                  WhatsAppModel callData = call[index];
                  return WhatsAppView(
                    detail: callData,
                  );
                })
          ],
        ),
      ),
    );
  }
}
