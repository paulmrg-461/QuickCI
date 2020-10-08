import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:quick_ci/User/bloc/user_bloc.dart';
import 'package:quick_ci/User/model/user.dart';
import 'package:quick_ci/User/ui/widgets/profile_header.dart';
import 'package:quick_ci/widgets/gradient_background.dart';

class ProfileScreen extends StatelessWidget {
  UserBloc userBloc;
  double screenHeight;
  double screenWidth;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.none:
              return Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.active:
              return showProfileData(snapshot);
              break;
            case ConnectionState.done:
              return showProfileData(snapshot);
              break;
            default:
              return showProfileData(snapshot);
              break;
          }
        });
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (snapshot.data == null || snapshot.hasError) {
      print("No logueado");
      return Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Text("Usuario no logueado. Por favor inicia sesión")
            ],
          ),
        ],
      );
    } else {
      print("Usuario logueado correctamente");
      var user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoUrl);
      return Stack(
        children: <Widget>[
          GradientBackground(
            height: screenHeight * 0.35,
            radius: 22.0,
          ),
          ListView(
            children: <Widget>[
              ProfileHeader(user),
              _headerTitle(),
            ],
          ),
        ],
      );
    }
  }

  Widget _headerTitle() {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.085, horizontal: 20.0),
      child: Text(
        "Perfil",
        style: TextStyle(
            fontFamily: "Lato",
            color: Colors.white,
            fontSize: 26.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
