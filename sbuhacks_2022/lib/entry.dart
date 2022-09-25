import 'package:flutter/material.dart';

class Entry extends StatefulWidget {
  @override
  State<Entry> createState() => _EntryState();
}

const List<String> list = <String>['select website', 'Two', 'Three', 'Four'];


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
        backgroundColor: Colors.green,
        title: Text('New Entry'),
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
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
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
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState!.validate()) {
                          // Process data.
                          test.add(myController.text);
                          print(test.last);
                        }
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
