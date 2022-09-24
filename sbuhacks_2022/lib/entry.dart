import 'package:flutter/material.dart';

class Entry extends StatefulWidget {
  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('New Entry'),
      ),
    );
  }
}
