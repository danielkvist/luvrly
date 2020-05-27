import 'package:flutter/material.dart';

class LoversNameForm extends StatefulWidget {
  final double height;
  final String labelText;
  final bool leftCornerRounded;
  final bool rightCornerRounded;
  final List<double> textInputpadding;
  final Function(String) onSubmitLoverName;

  LoversNameForm({
    Key key,
    @required this.height,
    @required this.labelText,
    @required this.leftCornerRounded,
    @required this.rightCornerRounded,
    @required this.textInputpadding,
    @required this.onSubmitLoverName,
  }) : super(key: key);

  @override
  _LoversNameFormState createState() => _LoversNameFormState();
}

class _LoversNameFormState extends State<LoversNameForm>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
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
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.grey[50],
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500].withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: widget.leftCornerRounded
                ? Radius.circular(95.0)
                : Radius.circular(0),
            topRight: widget.rightCornerRounded
                ? Radius.circular(95.0)
                : Radius.circular(0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            widget.textInputpadding[0],
            widget.textInputpadding[1],
            widget.textInputpadding[2],
            widget.textInputpadding[3],
          ),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: widget.labelText,
              hintText: 'Name',
            ),
            onFieldSubmitted: (value) {
              if (value.length >= 1) {
                widget.onSubmitLoverName(value);
              }
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
