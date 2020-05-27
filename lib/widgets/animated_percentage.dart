import 'package:flutter/material.dart';

class AnimatedPercentage extends AnimatedWidget {
  AnimatedPercentage({Key key, this.animation})
      : super(key: key, listenable: animation);

  final Animation<int> animation;

  @override
  build(BuildContext context) {
    return Text(
      '${animation.value.toString()}%',
      style: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.normal,
        fontFamily: 'Pacifico',
        color: Colors.white,
      ),
    );
  }
}
