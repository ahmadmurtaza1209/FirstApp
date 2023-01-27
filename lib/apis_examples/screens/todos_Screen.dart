import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/todos_model.dart';
import 'package:http/http.dart' as http;

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  Future<List<TodosMdel>> getTodos() async {
    List<TodosMdel> todosList = [];
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/todos");
    http.Response response = await http.get(uri);
    var decodeData = jsonDecode(response.body) as List;
    todosList =
        List<TodosMdel>.from(decodeData.map((json) => TodosMdel.fromJson(json)))
            .toList();

    return todosList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
              size: 30,
            )),
      ),
      body: FutureBuilder<List<TodosMdel>>(
          future: getTodos(),
          builder:
              (BuildContext context, AsyncSnapshot<List<TodosMdel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    TodosMdel screenData = snapshot.data![index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(screenData.title),
                        Text(screenData.completed.toString()),
                        Text(screenData.userId.toString())
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("Error");
            }
            return Container();
          }),
    );
  }
}
