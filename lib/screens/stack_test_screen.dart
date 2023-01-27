import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StackTestScreen extends StatelessWidget {
  const StackTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Blur(
            blur: 2,
            colorOpacity: 0.1,
            child: Container(
                height: 400,
                width: 400,
                child: Image.asset("Assets/images/Boy.png")),
          ),
          SvgPicture.asset(
            "Assets/svgs/phone.svg",
            height: 200,
            width: 200,
            color: Colors.amber,
          )
        ],
      )),
    );
  }
}
