import 'package:flutter/material.dart';

class ClassTask extends StatelessWidget {
  ClassTask({super.key});
  int count = 0;
  void incrementCount() {
    count = count + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("$count"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCount,
        child: Text("+"),
      ),
    );
  }
}
