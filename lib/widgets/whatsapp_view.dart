import 'package:flutter/material.dart';

import '../models/whatsapp_model.dart';

class WhatsAppView extends StatelessWidget {
  final WhatsAppModel detail;
  const WhatsAppView({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
        top: MediaQuery.of(context).size.height * 0.03,
        bottom: MediaQuery.of(context).size.height * 0.03,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(padding: EdgeInsets.only(left: 3)),
          Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: AssetImage(detail.image!), fit: BoxFit.fill))),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                detail.name!,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                detail.message!,
                style: TextStyle(
                    fontSize: 17, color: Color.fromARGB(255, 146, 144, 144)),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              detail.dateTime!,
              style: TextStyle(
                  color: Color.fromARGB(255, 146, 144, 144), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
