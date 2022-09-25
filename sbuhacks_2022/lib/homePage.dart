import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}


Card addEntry(){
  return Card(
    color: Colors.grey,
    margin: EdgeInsets.symmetric(vertical: 5.0),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Colors.black,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
    ),
    child: Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          width: 50.0,
          height: 70.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
                'https://i.pinimg.com/originals/e0/07/45/e00745be0b633770175b55dcfe2ade9e.jpg',
                fit: BoxFit.fill
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Series Name'
            ),
            Text(
                'Chapter'
            ),
            Text(
                'Date'
            )
          ],
        ),
      ],
    ),
  );
}

class _HomePageState extends State<HomePage> {
  List<Widget> items = [SizedBox(height: 3.0,)];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('App Name'
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
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
                onPressed: () {
                  setState(() {
                    items.add(addEntry());
                  });
                },
                backgroundColor: Colors.blue,
                splashColor:  Colors.green,
                child: Icon(Icons.refresh),
              )
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: items,
          ),
        ),
      ),
    );
  }
}





