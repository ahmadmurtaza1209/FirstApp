import 'package:flutter/material.dart';

class TableCreateScreen extends StatefulWidget {
  const TableCreateScreen({super.key});

  @override
  State<TableCreateScreen> createState() => _TableCreateScreenState();
}

class _TableCreateScreenState extends State<TableCreateScreen> {
  int digit = 2;
  List<dynamic> tableList = [];
  Stream<int> generateNumbers() async* {
    await Future<void>.delayed(Duration(seconds: 2));
    for (int i = 1; i <= 10; i++) {
      await Future<void>.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: StreamBuilder<int>(
              stream: generateNumbers(),
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                } else if (snapshot.hasData) {
                  int? numbers = snapshot.data;
                  dynamic data = Text(
                    "$digit x $numbers = ${digit * numbers!}",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  );
                  tableList.add(data);
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: tableList.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          child: tableList[index],
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text("Error occur");
                }
                return Container();
              }),
        ),
      ),
    );
  }
}
