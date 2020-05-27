import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedPercentage extends AnimatedWidget {
  AnimatedPercentage({Key key, this.animation})
      : super(key: key, listenable: animation);

  final Animation<int> animation;

  @override
  build(BuildContext context) {
    return Text(
      '${animation.value.toString()}%',
      style: GoogleFonts.pacifico(
        fontSize: 72.0,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    );
  }
}
