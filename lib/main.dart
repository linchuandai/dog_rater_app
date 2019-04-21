import 'package:flutter/material.dart';

import 'dog_model.dart';
import 'dog_list.dart';
import 'new_dog_form.dart';

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
                actions: [
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: _showNewDogForm,
                    )
                ]
            ),
            body: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end:Alignment.bottomLeft,
                        stops: [0.1, 0.5, 0.7, 0.9],
                        colors: [
                            Colors.indigo[800],
                            Colors.indigo[700],
                            Colors.indigo[600],
                            Colors.indigo[400],
                        ]
                    ),
                ),
                child: Center(
                    child: DogList(initialDoggos),
                ),
            ),
        );
    }

    Future _showNewDogForm() async {
        Dog newDog = await Navigator.of(context).push(
            MaterialPageRoute(
                builder: (BuildContext context) {
                        return AddDogFormPage();
                },
            ),
        );

        if (newDog != null) {
            initialDoggos.add(newDog);
        }
    }
}