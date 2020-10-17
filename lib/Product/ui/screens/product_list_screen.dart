import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:quick_ci/Product/model/product.dart';
import 'package:quick_ci/Product/ui/screens/product_content.dart';
import 'package:quick_ci/Product/ui/screens/product_header.dart';
import 'package:quick_ci/User/bloc/user_bloc.dart';
import 'package:quick_ci/User/repository/cloud_firestore_API.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

UserBloc userBloc;
CloudFirestoreAPI cloudFirestoreAPI = CloudFirestoreAPI();
Product product;

class _ProductListScreenState extends State<ProductListScreen> {
  String _barcode = '';
  Future<void> scanBarcode() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    if (int.parse(barcodeScanRes) > 1) {
      cloudFirestoreAPI.buildProductById(barcodeScanRes, context);
      /* Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailScreen(barcodeScanRes))); */
    }

    setState(() {
      _barcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 46.0),
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
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.225),
              child: ProductContent()),
          ProductHeader(),
        ],
      ),
    );
  }
}
