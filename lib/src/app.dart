// Copyright (c) 2022 Evolving Software Corporation
// 
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

// Import flutter helper library.
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

// Create a class that will be the custom widget.
// This class must extend the StatelessWidget class.
class AppState extends State<App> {
int counter = 0;




// Must define a build method that returns a widget.
// This widget is what is shown on the screen.

@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      body: Text('$counter'),
      appBar: AppBar(
        title: Text('My First App'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            // This call to setState tells Flutter that something has changed in this State,
            // and that it should rerun the build method to update the UI with the new values.
            counter += 1;
          });
        },
      ),
    ),
  );
}
}