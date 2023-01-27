import 'package:first_app/screens/whatsapp/whatsapp_call.dart';
import 'package:first_app/screens/whatsapp/whatsapp_chat.dart';
import 'package:first_app/screens/whatsapp/whatsapp_status.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class MyTabView extends StatefulWidget {
  const MyTabView({super.key});

  @override
  State<MyTabView> createState() => _MyTabViewState();
}

class _MyTabViewState extends State<MyTabView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(250, 18, 140, 126),
            title: const Text(
              "WhatsApp",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 25,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.search_sharp,
                  color: Colors.white,
                  size: 25,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                  size: 25,
                ),
                onPressed: () {},
              ),
            ],
            bottom: const TabBar(
                unselectedLabelColor: Color.fromARGB(255, 220, 214, 214),
                labelColor: Colors.white,
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    text: "Chats",
                  ),
                  Tab(
                    text: "Status",
                  ),
                  Tab(
                    text: "Calls",
                  ),
                ]),
          ),
          body: TabBarView(children: [
            WhatsAppChat(),
            WhatsAppStatus(),
            WhatsAppCall(),
          ]),
        ));
  }
}
