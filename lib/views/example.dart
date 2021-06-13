import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:untitled/models/content.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SwipableStackController _controller = SwipableStackController();

  void _listenController() {
    setState(() {});
  }

  @override
  void initState() {
    _controller = SwipableStackController()..addListener(_listenController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: SafeArea(
        child: SwipableStack(
          horizontalSwipeThreshold: 0.1,
          verticalSwipeThreshold: 0.1,
          controller: _controller,
          onSwipeCompleted: (index, direction) {
            // print('$index, $direction');
          },
          onWillMoveNext: (index, direction) {
            final allowedActions = [
              SwipeDirection.down,
              SwipeDirection.up,
              SwipeDirection.left,
              SwipeDirection.right,
            ];
            return allowedActions.contains(direction);
          },
          builder: (context, index, constraints) {
            // print(index);
            int rIndex = index % cards.length;
            // final imagePath = _images[rIndex];
            return cards[rIndex];
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_listenController);
    _controller.dispose();
  }
}
