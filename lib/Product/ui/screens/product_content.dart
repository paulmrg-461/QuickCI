import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:quick_ci/User/bloc/user_bloc.dart';

class ProductContent extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return StreamBuilder(
        stream: userBloc.productsStream,
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.none:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
              return ListView(
                children: userBloc.buildProducts(snapshot.data.documents),
              );
            case ConnectionState.done:
              return ListView(
                children: userBloc.buildProducts(snapshot.data.documents),
              );
            default:
              return ListView(
                children: userBloc.buildProducts(snapshot.data.documents),
              );
          }
        });
  }
}
