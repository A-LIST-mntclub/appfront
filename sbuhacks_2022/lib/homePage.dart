import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homescreen'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton.extended(
              backgroundColor: Colors.blue,
              splashColor: Colors.green,
              icon: Icon(
                  Icons.add
              ),
              label: const Text('Add New Entry'),
              onPressed: () {
                Navigator.pushNamed(context, '/entry');
              },
            ),
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.blue,
              splashColor:  Colors.green,
              child: Icon(Icons.refresh_sharp),
            )
          ],
        ),
      ),
    );
  }
}


