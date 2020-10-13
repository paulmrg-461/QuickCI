import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:quick_ci/User/bloc/user_bloc.dart';

class ProductDetailScreen extends StatelessWidget {
  String barcode;
  ProductDetailScreen(this.barcode);

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

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
  }
}
