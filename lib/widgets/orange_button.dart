import 'package:flutter/material.dart';

class OreangeButton extends StatefulWidget {
  final String text;
  double width = 0.0;
  double height = 0.0;
  final double radius;
  final VoidCallback onPressed;

  OreangeButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.height,
      this.width,
      @required this.radius});

  @override
  _OreangeButtonState createState() => _OreangeButtonState();
}

class _OreangeButtonState extends State<OreangeButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 30.0, left: 18.0, right: 18.0),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            gradient: LinearGradient(
                colors: [
                  Color(0xFFE64A19), //arriba
                  Color(0xFFFF5722) //bajo
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
                fontSize: 18.0,
                fontFamily: "Lato",
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
