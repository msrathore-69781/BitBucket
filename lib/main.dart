import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './login.dart';
import 'dart:convert';

import 'package:q1/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}
