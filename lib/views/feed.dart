import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/models/content.dart';

class feed extends StatefulWidget {
  const feed({Key? key}) : super(key: key);

  @override
  _feedState createState() => _feedState();
}

class _feedState extends State<feed> {
  final _controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final pageView = PageView.builder(
      controller: _controller,
      dragStartBehavior: DragStartBehavior.down,
      scrollDirection: Axis.vertical,
      itemCount: 4,
      itemBuilder: (context, i)=>cards[i],
    );
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: pageView,
      ),
    ));
  }
}
