// Copyright (c) 2022 Evolving Software Corporation
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

// ignore_for_file: deprecated_member_use

// Import flutter helper library.
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' show get;
import './models/image_model.dart';
import './widgets/image_list.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

// Create a class that will be the custom widget.
// This class must extend the StatelessWidget class.
class AppState extends State<App> {
  int counter = 0;
  List<PexelsModel> photos = [];
  void fetchImage() async {
    counter++;
    Uri uri = Uri.https(
      'api.pexels.com',
      '/v1/search',
      {
        'curated': 'true',
        'query': 'nature',
        'per_page': '50',
        'page': '$counter',
      },
    );
    var httpResponse = await get(
        uri,
        headers: {
          'Authorization':
              '563492ad6f917000010000014a2dac3ddf21465cabc3c5081122f753',
        });
    // instantiate the model class. if the ersponse contains html then throw an exception and print the error.
    if (httpResponse.statusCode == 200) {
      var decodedJson = json.decode(httpResponse.body);
      var pexelsModel = PexelsModel.fromJson(decodedJson);
      setState(() {
        photos.add(pexelsModel);
      });
    } else {
      print('Error Original Requested URL: ${uri.toString()}');
      // print('Error: ${httpResponse.statusCode}');
      // print(httpResponse.statusCode);
      // print(httpResponse.body);
      throw Exception('Failed to load photos');
    }
  }
// Must define a build method that returns a widget.
// This widget is what is shown on the screen.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(photos),
        appBar: AppBar(
          title: Text('My First App'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
      ),
    );
  }
}
