import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final String text;
  double width = 0.0;
  double height = 0.0;
  final VoidCallback onPressed;

  SearchBar(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.height,
      this.width});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 18.0),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            shape: BoxShape.rectangle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 7.0))
            ],
            gradient: LinearGradient(
                colors: [
                  Color(0xFFFFFFFF), //arriba
                  Color(0xFFF5F5F5) //bajo
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp)),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(
                  Icons.search,
                  color: Colors.black38,
                ),
              ),
              Text(
                widget.text,
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "Lato",
                    color: Colors.black38,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
