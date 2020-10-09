import 'package:flutter/material.dart';
import 'package:quick_ci/widgets/gradient_background.dart';
import 'package:quick_ci/widgets/search_bar.dart';

class ProductHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientBackground(
          height: MediaQuery.of(context).size.height * 0.185,
          radius: 18.0,
        ),
        _headerTitle(context),
        Container(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.16),
            child: SearchBar(text: "Buscar producto...", onPressed: () {}))
      ],
    );
  }

  Widget _headerTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.085,
          horizontal: 20.0),
      child: Text(
        "Listado de productos",
        style: TextStyle(
            fontFamily: "Lato",
            color: Colors.white,
            fontSize: 26.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
