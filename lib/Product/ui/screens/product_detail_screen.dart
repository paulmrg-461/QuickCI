import 'package:flutter/material.dart';
import 'package:quick_ci/Product/model/product.dart';
import 'package:quick_ci/Product/ui/screens/product_content.dart';
import 'package:quick_ci/Product/ui/widgets/product_detail_content.dart';
import 'package:quick_ci/User/repository/cloud_firestore_API.dart';

class ProductDetailScreen extends StatelessWidget {
  String barcode;
  ProductDetailScreen(this.barcode);

  @override
  Widget build(BuildContext context) {
    CloudFirestoreAPI cloudFirestoreAPI = CloudFirestoreAPI();
    //cloudFirestoreAPI.buildProductById(barcode);
    return Scaffold(
      body: Text("TOLOWER"),
    );
  }
}
/* UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: userBloc.productByBarcode(barcode),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.done:
              return ListView(
                children:
                    userBloc.buildProductByBarcode(snapshot.data.documents),
              );
              break;
            case ConnectionState.active:
              return ListView(
                children:
                    userBloc.buildProductByBarcode(snapshot.data.documents),
              );
              break;
            case ConnectionState.none:
              return Center(child: CircularProgressIndicator());
              break;
            default:
              return ListView(
                children:
                    userBloc.buildProductByBarcode(snapshot.data.documents),
              );
              break;
          }
        });
  } */
