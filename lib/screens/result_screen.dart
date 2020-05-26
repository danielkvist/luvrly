import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luvrly/screens/lovers_name_screen.dart';

class ResultScreen extends StatefulWidget {
  final String firstLoverName;
  final String secondLoverName;

  ResultScreen({
    Key key,
    @required this.firstLoverName,
    @required this.secondLoverName,
  }) : super(key: key);
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  int result;

  void calculateResult() {
    setState(() {
      int random = Random().nextInt(100) + 1;
      if (random < 5) {
        result = 5;
      } else {
        result = random;
      }
    });
    _controller..forward(from: 0.0);
  }

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    calculateResult();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.pink, Colors.purple],
            ),
          ),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 32.0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoversNameScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Center(
                child: AnimatedPercentage(
                  animation:
                      StepTween(begin: 0, end: result).animate(_controller),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FloatingActionButton(
                    child: Icon(Icons.repeat),
                    tooltip: 'View compability',
                    onPressed: () => {calculateResult()},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

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
