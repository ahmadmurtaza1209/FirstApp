import 'package:flutter/material.dart';

class LoginPannel extends StatelessWidget {
  const LoginPannel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Image.asset(
              "Assets/images/logo.jpg",
              height: 100,
              width: 100,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 40, 10, 5),
              child: TextFormField(
                decoration:
                    InputDecoration(hintText: "Your Email", labelText: "Email"),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 30),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    suffixText: "Forgot password?",
                    suffixStyle: TextStyle(color: Colors.blue),
                    suffixIcon: Icon(Icons.remove_red_eye)),
              ),
            ),
            InkWell(
              child: Container(
                  // container displaying the text
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 57, 151, 228),
                  ),
                  child: Center(
                      child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ))),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New to Wpay?",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                Text(
                  "SignUp",
                  style: TextStyle(
                      color: Color.fromARGB(255, 18, 134, 229),
                      fontSize: 17,
                      decoration: TextDecoration.underline),
                )
              ],
            ),
            const Expanded(child: Center()),
            // SizedBox(
            //   height: 50,
            // ),
            Container(
              child: Text("or continue with",
                  style: TextStyle(color: Colors.grey, fontSize: 17)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      width: 2, color: Color.fromARGB(255, 220, 218, 218))),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 223, 221, 221),
                    ),
                    child: Icon(
                      Icons.facebook,
                      color: Colors.blue,
                      size: 35,
                    ),
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Text(
                    "Login with Facebook",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              padding: EdgeInsets.fromLTRB(9, 0, 0, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      width: 2, color: Color.fromARGB(255, 220, 218, 218))),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 223, 221, 221),
                    ),
                    child: Image.asset(
                      "Assets/images/google_logo.png",
                      height: 30,
                      width: 30,
                    ),
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Text(
                    "Login with Google",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
