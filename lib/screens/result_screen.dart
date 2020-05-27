import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:luvrly/screens/lovers_name_screen.dart';
import 'package:luvrly/widgets/animated_percentage.dart';

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
  FlareControls _flareControls = FlareControls();
  int _result;

  void _playFlareAnimation() => {_flareControls.play('go')};

  void _calculateResult() {
    setState(() {
      int random = Random().nextInt(100) + 1;
      if (random < 5) {
        _result = 5;
      } else {
        _result = random;
      }
    });

    _controller..forward(from: 0.0);
    _playFlareAnimation();
  }

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _calculateResult();

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
              Center(
                child: Container(
                  width: 500,
                  height: 500,
                  child: FlareActor(
                    "assets/animations/result.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    controller: _flareControls,
                  ),
                ),
              ),
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
                      StepTween(begin: 0, end: _result).animate(_controller),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FloatingActionButton(
                    child: Icon(Icons.repeat),
                    tooltip: 'View compability',
                    onPressed: () => {_calculateResult()},
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
