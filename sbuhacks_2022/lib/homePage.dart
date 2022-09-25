import 'package:flutter/material.dart';
import 'entry.dart';
import 'models/shell.dart';
import 'models/series.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'request.dart';
import 'package:dio/dio.dart';


class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}


Card addEntry(Series entry){
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
            entry.chapterImg,
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
            Text('Series Name:' + entry.chapterName),
            Text(
                'Chapter:' + entry.chapterCount),
            Text(
                'Date: ' + entry.chapterDate)
          ],
        ),
      ],
    ),
  );
}
Shell collection = Shell();

class _HomePageState extends State<HomePage> {

  Future<Album> getUpdate(String url) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/'),
        body: jsonEncode(<String, String>{ 'url' : url,}),
    );
    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get series');
    }

  }

  List<Widget> items = [];
  //this add a new card
  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => Entry()),
    );
    print('check1');
    print(collection.list.length);
    setState(() {
      collection.list.add(result);
    });
    print('check2');
    print(collection.list.length);
    items.add(addEntry(collection.list.first));

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('A-List'
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
                heroTag: "Piaro",
                backgroundColor: Colors.blue,
                splashColor: Colors.green,
                icon: Icon(
                    Icons.add
                ),
                label: const Text('Add New Entry'),
                onPressed: () {
                  setState(() {
                    print('checkpoint1');
                    _navigateAndDisplaySelection(context);
                    print('checkpoint2');
                  });
                },
              ),
              FloatingActionButton(
                heroTag: "Asmophel",
                onPressed: () {
                  collection.list.first.toJson();
                  Future<void> createSeries(Series list, int index) async{
                    final response = await http.post(
                      Uri.parse('http://localhost:3000/'),
                        headers: {
                          "Content-Type": "application/json"
                        },
                      body: jsonEncode(list),
                    );

                    if (response.statusCode == 200) {
                      // If the server did return a 201 CREATED response,
                      // then parse the JSON.
                      setState(() {
                        collection.list[index].chapterImg = ((jsonDecode(response.body))[0]['url']);
                        collection.list[index].chapterName = ((jsonDecode(response.body))[0]['name']);
                        collection.list[index].chapterDate = ((jsonDecode(response.body))[0]['date']);
                        collection.list[index].chapterCount = ((jsonDecode(response.body))[0]['Chapter'].toString());
                        items[index] = (addEntry(collection.list[index]));

                      });


                    } else {
                      print(response.statusCode);
                      // If the server did not return a 201 CREATED response,
                      // then throw an exception.
                      throw Exception('Failed to create album.');
                    }
                  }
                  for (int i = 0; i < collection.list.length;i++){
                    createSeries(collection.list[i],i);
                  }

                  //                  String jsonUser = jsonEncode(collection);
                  //                   print(jsonUser);
                },
                backgroundColor: Colors.blue,
                splashColor:  Colors.green,
                child: Icon(Icons.refresh),
              )
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: items,
            ),
          ),
        ),
      ),
    );
  }
}







