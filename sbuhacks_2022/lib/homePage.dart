import 'package:flutter/material.dart';
import 'entry.dart';
import 'models/shell.dart';
import 'models/series.dart';


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
            'https://upload.wikimedia.org/wikipedia/commons/4/44/Cat_img.jpg',
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
            Text('Series Name:'),
            Text(
                'Chapter:'),
            Text(
                'Date')
          ],
        ),
      ],
    ),
  );
}
Shell collection = Shell();
class _HomePageState extends State<HomePage> {
  List<Widget> items = [SizedBox(height: 3.0,)];
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
    items.add(addEntry());

  }
  Future<void> addCardUpdate() async {}
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







