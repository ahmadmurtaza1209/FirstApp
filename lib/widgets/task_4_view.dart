import 'package:first_app/models/task4_model.dart';
import 'package:first_app/screens/home_task_4_S1.dart';
import 'package:flutter/material.dart';

class Task4View extends StatelessWidget {
  final Task4Model data;
  Task4View({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return HomeTask4S1(
            detail: data,
          );
        }));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: const Offset(2, 2), // changes position of shadow
                  ),
                ],
              ),
              height: 100,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 90, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 5)),
                        Text(
                          data.code,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.grey,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 110,
              width: 105,
              margin: const EdgeInsets.only(left: 10),
              child: Image.asset(
                data.image,
                height: 110,
                width: 105,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }
}
