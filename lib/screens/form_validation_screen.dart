import 'package:flutter/material.dart';

class FormValidationScreen extends StatefulWidget {
  const FormValidationScreen({super.key});

  @override
  State<FormValidationScreen> createState() => _FormValidationScreenState();
}

class _FormValidationScreenState extends State<FormValidationScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: ListView(
          children: [
            TextFormField(
              validator: (input) {
                if (input != null) {
                  if (input.isEmpty) {
                    return "please type email";
                  }
                }
              },
              decoration: InputDecoration(hintText: "enter email"),
            ),
            TextButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) print("logged in");
                },
                child: Text("login"))
          ],
        ),
      ),
    );
  }
}
