import 'package:flutter/material.dart';

class LoversNameScreen extends StatefulWidget {
  @override
  _LoversNameScreenState createState() => _LoversNameScreenState();
}

class _LoversNameScreenState extends State<LoversNameScreen> {
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
              child: LoversNameForm(),
            ),
          ],
        ),
      ),
    );
  }
}

class LoversNameForm extends StatefulWidget {
  LoversNameForm({Key key}) : super(key: key);

  @override
  _LoversNameFormState createState() => _LoversNameFormState();
}

class _LoversNameFormState extends State<LoversNameForm>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  void _showSecondLoverNameForm() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(95.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(25.0, 25.0, 95.0, 0.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Second lover',
                hintText: 'Name',
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height - 75,
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(95.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(95.0, 25.0, 25.0, 0),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'First lover',
              hintText: 'Name',
            ),
            onFieldSubmitted: (value) {
              _showSecondLoverNameForm();
            },
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
