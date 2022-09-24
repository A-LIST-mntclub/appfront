import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

Card addEntry(){
  return Card(
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
    color: Colors.grey,
  );
}

class MyApp extends StatelessWidget {
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
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 3.0,
              ),
              addEntry(),
              addEntry(),
              addEntry(),
            ],
          ),
        ),
      ),
    );
  }
}