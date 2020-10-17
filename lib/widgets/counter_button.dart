import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  final String text;
  final double radius;
  final VoidCallback onPressed;
  final int price;
  int total = 0;
  int quantity = 1;

  CounterButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      @required this.radius,
      @required this.price});

  @override
  _CounterButtonState createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  @override
  Widget build(BuildContext context) {
    widget.total = widget.price * widget.quantity;
    return Stack(
      children: [
        Container(
            margin:
                EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.4),
            child: _transparentButton()),
        Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.425,
            ),
            child: _orangeButton())
      ],
    );
  }

  Widget _transparentButton() {
    return Container(
      margin: EdgeInsets.only(
        top: 30.0,
        left: 18.0,
      ),
      width: MediaQuery.of(context).size.width * 0.6,
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          border: Border.all(
              color: Colors.black38, width: 1.5, style: BorderStyle.solid)),
      child: Center(
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove_outlined),
              color: Colors.black54,
              onPressed: () {
                if (widget.quantity > 1) {
                  setState(() {
                    widget.quantity -= 1;
                    widget.total = widget.price * widget.quantity;
                  });
                }
              },
              iconSize: 28.0,
              splashColor: Colors.red,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: "Lato",
                    color: Colors.black38,
                  ),
                ),
                Text(
                  "${widget.quantity}",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: "Lato",
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.black54,
              onPressed: () {
                if (widget.quantity < 15) {
                  setState(() {
                    widget.quantity += 1;
                    widget.total = widget.price * widget.quantity;
                  });
                }
              },
              iconSize: 28.0,
              splashColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _orangeButton() {
    return InkWell(
        onTap: widget.onPressed,
        child: Container(
          margin: EdgeInsets.only(top: 30.0, right: 18.0),
          width: MediaQuery.of(context).size.width * 0.575,
          height: 50.0,
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
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    "\$${widget.total}",
                    style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: "Lato",
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
