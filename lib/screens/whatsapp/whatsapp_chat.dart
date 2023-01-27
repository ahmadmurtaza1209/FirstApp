import 'package:first_app/widgets/whatsapp_view.dart';
import 'package:flutter/material.dart';

import '../../models/whatsapp_model.dart';

class WhatsAppChat extends StatelessWidget {
  WhatsAppChat({super.key});
  List<WhatsAppModel> chat = [
    WhatsAppModel(
        image: "Assets/images/img_1.jpeg",
        name: "Ahmad",
        message: "Hey! I'm using WhatsApp",
        dateTime: "Yesterday"),
    WhatsAppModel(
        image: "Assets/images/img_2.jpeg",
        name: "Muhammad Bilal",
        message: "I am fine",
        dateTime: "20/02/2020"),
    WhatsAppModel(
        image: "Assets/images/img_3.jpeg",
        name: "Jameel Ahma",
        message: "oky ",
        dateTime: "18/01/2020"),
    WhatsAppModel(
        image: "Assets/images/img_4.jpeg",
        name: "John",
        message: "Hey! I'm using WhatsApp",
        dateTime: "01/03/2018"),
    WhatsAppModel(
        image: "Assets/images/img_5.jpeg",
        name: "Jamshed",
        message: "I am going to lhr",
        dateTime: "03/05/2016"),
    WhatsAppModel(
        image: "Assets/images/img_6.jpeg",
        name: "MAT",
        message: "Good Morning",
        dateTime: "17/05/2010"),
    WhatsAppModel(
        image: "Assets/images/img_4.jpeg",
        name: "John",
        message: "Hey! I'm using WhatsApp",
        dateTime: "01/03/2018"),
    WhatsAppModel(
        image: "Assets/images/img_3.jpeg",
        name: "Jameel Ahma",
        message: "oky ",
        dateTime: "18/01/2020"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: chat.length,
        itemBuilder: (BuildContext context, index) {
          WhatsAppModel chatData = chat[index];
          return WhatsAppView(
            detail: chatData,
          );
        });
  }
}
