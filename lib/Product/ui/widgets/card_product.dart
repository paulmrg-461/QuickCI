import 'package:flutter/material.dart';
import 'package:quick_ci/Product/model/product.dart';

class CardProduct extends StatelessWidget {
  Product product;
  CardProduct(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("Hola amiguis: ${product.name}"),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
        padding: EdgeInsets.all(12.0),
        width: double.infinity,
        //height: _screenSize.height * 0.12,
        height: 110.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
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
        child: _cardProductInformation(context),
      ),
    );
  }

  Widget _cardProductInformation(BuildContext context) {
    return Row(
      children: [
        _productImage(context),
        _productDetails(context),
      ],
    );
  }

  Widget _productImage(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      width: MediaQuery.of(context).size.height * 0.075,
      height: MediaQuery.of(context).size.height * 0.075,
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white, width: 0.1, style: BorderStyle.solid),
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/products.jpg"),
          )),
    );
  }

  Widget _productDetails(BuildContext context) {
    final productBarcode = product.barcode.toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              product.name,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontFamily: "Lato",
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.65,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$${product.price}",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Lato",
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        "PLU: ${product.barcode}",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Lato",
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 35.0,
                  height: 35.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                        color: Color(0xFFE64A19),
                        width: 2.0,
                        style: BorderStyle.solid),
                  ),
                  child: Center(
                      child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 20,
                    color: Color(0xFFE64A19),
                  )),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
