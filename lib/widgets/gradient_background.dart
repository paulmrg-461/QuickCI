import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  String title = "Product List";
  double height = 0.0;
  double radius = 0.0;

  GradientBackground({Key key, this.height, this.radius});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;

    if (height == null) {
      height = screenHeight;
    }
    return Container(
      width: screenWidht,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius)),
          gradient: LinearGradient(
              colors: [
                Color(0xFF303F9F),
                Color(0xFF3F51B5),
                Color(0xFF03A9F4),
              ],
              begin: FractionalOffset(0.3, 0.1),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6, 1.0],
              tileMode: TileMode.clamp)),

      child: FittedBox(
        fit: BoxFit.none,
        alignment: Alignment(-1.5, -0.8),
        child: Container(
          width: screenHeight,
          height: screenHeight,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            borderRadius: BorderRadius.circular(screenHeight / 2),
          ),
        ),
      ),
      /*Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontFamily: "Lato",
          fontWeight: FontWeight.bold
        ),
      )*/

      //alignment: Alignment(-0.9, -0.6),
    );
  }
}
