import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:quick_ci/User/bloc/user_bloc.dart';

class ProductsList extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return Container();

    /* StreamBuilder(
        stream: userBloc.productsListStream,
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.done:
              return Column(
                children: userBloc.buildProducts(snapshot.data.documents),
              );
              break;
            case ConnectionState.active:
              return Column(
                children: userBloc.buildProducts(snapshot.data.documents),
              );
              break;
            case ConnectionState.none:
              return Center(child: CircularProgressIndicator());
              break;
            default:
              return Column(
                children: userBloc.buildProducts(snapshot.data.documents),
              );
              break;
          }
        }); */
  }
}
