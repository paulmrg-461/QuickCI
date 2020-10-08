import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:quick_ci/Product/ui/widgets/card_product.dart';
import 'package:quick_ci/widgets/gradient_background.dart';
import 'package:quick_ci/widgets/search_bar.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  String _barcode = 'Unknown';
  Future<void> scanBarcode() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _barcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 60.0),
        child: FloatingActionButton(
          child: Icon(
            Icons.qr_code,
            size: 32.0,
          ),
          onPressed: () => scanBarcode(),
          splashColor: Colors.blue,
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Text("Código de barras: $_barcode"),
          ),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.24),
              child: CardProduct()),
          GradientBackground(
            height: MediaQuery.of(context).size.height * 0.185,
            radius: 18.0,
          ),
          _headerTitle(),
          Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.16),
              child: SearchBar(text: "Buscar producto...", onPressed: () {}))
        ],
      ),
    );
  }

  Widget _headerTitle() {
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
