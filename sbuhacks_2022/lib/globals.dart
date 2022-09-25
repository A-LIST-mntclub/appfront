import 'package:flutter/material.dart';
import 'entry.dart';
import 'models/shell.dart';
import 'models/series.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'request.dart';
import 'globals.dart';


Shell collection = Shell();
List<Widget> items = [];