import 'package:flutter/material.dart';
import 'entry.dart';
import 'models/shell.dart';
import 'models/series.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'request.dart';
import 'globals.dart' as globals;


class Entry extends StatefulWidget {
  @override
  State<Entry> createState() => _EntryState();
}

const List<String> list = <String>['select website', 'Two', 'Three', 'Four'];

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


class _EntryState extends State<Entry> {
  List<String> test = [];
  String dropdownValue = list.first;
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('New Entry', style: TextStyle(color: Colors.black),),
      ),
      body: Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center ,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    flex: 1,
                      child: SizedBox()
                  ),
                  Expanded(
                    flex: 10,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          child: new Align(alignment: Alignment.center, child: Text(value)),
                          value: value,);
                      }).toList(),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                      child: SizedBox()
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                child: TextFormField(
                  controller: myController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your link here',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a link';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed:() {
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
                              globals.collection.list[index].chapterImg = ((jsonDecode(response.body))[0]['url']);
                              globals.collection.list[index].chapterName = ((jsonDecode(response.body))[0]['name']);
                              globals.collection.list[index].chapterDate = ((jsonDecode(response.body))[0]['date']);
                              globals.collection.list[index].chapterCount = ((jsonDecode(response.body))[0]['Chapter'].toString());
                              globals.items[index] = (addEntry(globals.collection.list[index]));

                            });

                          } else {
                            print(response.statusCode);
                            // If the server did not return a 201 CREATED response,
                            // then throw an exception.
                            throw Exception('Failed to create album.');
                          }
                        }
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState!.validate()) {
                          // Process data.
                          Series test1 = Series('abc','blah','9/25/22','https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aHVtYW58ZW58MHx8MHx8&w=1000&q=80',true);

                          Navigator.pop(context, test1);
                        }
<<<<<<< Updated upstream
=======
                        for (int i = 0; i < globals.collection.list.length;i++){
                          createSeries(globals.collection.list[i],i);
                        }

>>>>>>> Stashed changes
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ],
        ),
      ),
    );
  }
}
