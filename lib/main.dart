import 'package:flutter/material.dart';

import 'dog_model.dart';
import 'dog_list.dart';

void main() => runApp(HomeApp());

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "We Rate Dogs",
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(title: "We Rate Dogs"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dog> initialDoggos = []
    ..add(Dog('Ruby', 'Toronto, ON', 'Best dog'))
    ..add(Dog('Snowball', 'Markham, ON', 'The goodest boy'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        child: Center(
          child: DogList(initialDoggos),
        ),
      ),
    );
  }
}