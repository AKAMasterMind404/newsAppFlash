import 'package:flutter/material.dart';
import 'package:untitled/views/example.dart';
import 'package:untitled/views/feed.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'ex',
        routes: {
          '/': (context) => feed(),
          'ex': (context) => Home(),
        },
      )
  );
}