import 'package:flutter/material.dart';
import 'package:quick_ci/Product/model/product.dart';
import 'package:quick_ci/widgets/counter_button.dart';

class ProductDetailContent extends StatefulWidget {
  Product product;
  ProductDetailContent(this.product);

  @override
  _ProductDetailContentState createState() => _ProductDetailContentState();
}

class _ProductDetailContentState extends State<ProductDetailContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _background(),
        _productDetailWrapper(),
        Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.45),
            child: CounterButton(
              text: "Cantidad",
              onPressed: () => print("Hola Amiguis"),
              radius: 30,
              price: widget.product.price,
            ))
      ],
    );
  }

  Widget _background() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFFBDBDBD),
                  Color(0xFFFFFFFF),
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(0.5, 0.9),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp)),
        child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: MediaQuery.of(context).size.height * 0.075),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 8.0),
                  child: IconButton(
                      icon: Icon(Icons.close),
                      iconSize: 32,
                      color: Colors.black54,
                      onPressed: () {
                        //userBloc.productSelectedStreamController.onCancel;
                        Navigator.pop(context);
                      }),
                ),
                Text(
                  "Detalle del producto",
                  style: TextStyle(
                      fontSize: 28.0,
                      fontFamily: "Lato",
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold),
                )
              ],
            )));
  }

  Widget _productDetailWrapper() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.only(
          left: 18.0,
          right: 18.0,
          top: MediaQuery.of(context).size.height * 0.175,
          bottom: MediaQuery.of(context).size.height * 0.45),
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
      child: _productDetails(),
    );
  }

  Widget _productDetails() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 18),
            child: Text(
              widget.product.name,
              style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0),
            child: Text(
              "Marca: ${widget.product.brand}",
              style: TextStyle(
                  fontSize: 18.0, fontFamily: "Lato", color: Colors.black87),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0),
            child: Text(
              "\$ ${widget.product.price}",
              style: TextStyle(
                  fontSize: 18.0, fontFamily: "Lato", color: Colors.black87),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0),
            child: Text(
              "Categoría: ${widget.product.category}",
              style: TextStyle(
                  fontSize: 18.0, fontFamily: "Lato", color: Colors.black87),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0),
            child: Text(
              "PLU: ${widget.product.barcode}",
              style: TextStyle(
                  fontSize: 18.0, fontFamily: "Lato", color: Colors.black87),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0),
            child: Text(
              "IVA: ${widget.product.iva}",
              style: TextStyle(
                  fontSize: 18.0, fontFamily: "Lato", color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
