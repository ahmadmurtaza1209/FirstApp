import 'package:first_app/apis_examples/screens/post_data_screen.dart';
import 'package:first_app/screens/class_task.dart';
import 'package:first_app/screens/counter_screen.dart';
import 'package:first_app/screens/drawer_test_screen.dart';
import 'package:first_app/screens/home_page.dart';
import 'package:first_app/screens/home_screen.dart';
import 'package:first_app/screens/home_task.dart';
import 'package:first_app/screens/home_task_4.dart';
import 'package:first_app/screens/login_pannel.dart';
import 'package:first_app/screens/my_tab_view.dart';
import 'package:first_app/screens/screen_first.dart';
import 'package:first_app/screens/screen_second.dart';
import 'package:first_app/screens/screen_third.dart';
import 'package:first_app/screens/stack_test_screen.dart';
import 'package:first_app/screens/table_create_screen.dart';
import 'package:first_app/screens/week5_home_task_screen.dart';
import 'package:flutter/material.dart';

import 'apis_examples/screens/api_screen.dart';
import 'apis_examples/screens/post_list_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: TableCreateScreen());
  }
}
