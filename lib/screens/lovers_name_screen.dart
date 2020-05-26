import 'package:flutter/material.dart';
import 'package:luvrly/widgets/lovers_form.dart';
import 'package:luvrly/screens/result_screen.dart';

class LoversNameScreen extends StatefulWidget {
  @override
  _LoversNameScreenState createState() => _LoversNameScreenState();
}

class _LoversNameScreenState extends State<LoversNameScreen> {
  String firstLoverName = "";
  String secondLoverName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
              alignment: Alignment.bottomCenter,
              child: LoversNameForm(
                height: MediaQuery.of(context).size.height - 75,
                labelText: 'First lover',
                leftCornerRounded: true,
                rightCornerRounded: false,
                textInputpadding: [95.0, 25.0, 25.0, 0],
                onSubmitLoverName: (String name) =>
                    {setState(() => firstLoverName = name)},
              ),
            ),
            Visibility(
              visible: firstLoverName != "",
              child: Align(
                alignment: Alignment.bottomCenter,
                child: LoversNameForm(
                  height: MediaQuery.of(context).size.height - 245,
                  labelText: 'Second lover',
                  leftCornerRounded: false,
                  rightCornerRounded: true,
                  textInputpadding: [25.0, 25.0, 95.0, 0],
                  onSubmitLoverName: (String name) =>
                      {setState(() => secondLoverName = name)},
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: firstLoverName != "" && secondLoverName != "" ? 1.0 : 00,
              duration: Duration(milliseconds: 500),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FloatingActionButton(
                    child: Icon(Icons.arrow_forward),
                    tooltip: 'View compability',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            firstLoverName: firstLoverName,
                            secondLoverName: secondLoverName,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
