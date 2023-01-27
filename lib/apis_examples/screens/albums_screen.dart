import 'dart:convert';

import 'package:first_app/apis_examples/models/albums_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  Future<List<AlbumsModel>> getAlbums() async {
    List<AlbumsModel> albumsList = [];
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/albums");
    http.Response response = await http.get(uri);
    var decodeData = jsonDecode(response.body) as List;
    albumsList = List<AlbumsModel>.from(
        decodeData.map((json) => AlbumsModel.fromJson(json))).toList();

    return albumsList;
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
      body: FutureBuilder<List<AlbumsModel>>(
          future: getAlbums(),
          builder: (BuildContext context,
              AsyncSnapshot<List<AlbumsModel>> snapshot) {
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
                    AlbumsModel screenData = snapshot.data![index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          screenData.id.toString(),
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        Text(
                          screenData.title,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
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
