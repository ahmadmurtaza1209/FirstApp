import 'dart:convert';

import 'package:first_app/apis_examples/models/photos_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  Future<List<PhotosMdel>> getPhotos() async {
    List<PhotosMdel> photosList = [];
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    http.Response response = await http.get(uri);
    var decodeData = jsonDecode(response.body) as List;
    photosList = List<PhotosMdel>.from(
        decodeData.map((json) => PhotosMdel.fromJson(json))).toList();

    return photosList;
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
      body: FutureBuilder<List<PhotosMdel>>(
          future: getPhotos(),
          builder:
              (BuildContext context, AsyncSnapshot<List<PhotosMdel>> snapshot) {
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
                    PhotosMdel screenData = snapshot.data![index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          screenData.id.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          screenData.title,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          screenData.albumId.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Container(
                          child: Image.network(screenData.url),
                          height: 150,
                          width: 150,
                        )
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
