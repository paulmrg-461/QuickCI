import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:quick_ci/User/bloc/user_bloc.dart';
import 'package:quick_ci/User/model/user.dart';
import 'package:quick_ci/bottom_nav_bar.dart';
import 'package:quick_ci/widgets/gradient_background.dart';
import 'package:quick_ci/widgets/orange_button.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  UserBloc userBloc;
  double screenWidth;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //snapshot- data - Object User
        if (!snapshot.hasData || snapshot.hasError) {
          return signInGoogleUI();
        } else {
          return BottomNavBar();
        }
      },
    );
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBackground(
            height: null,
            radius: 0.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                  width: screenWidth,
                  child: Text(
                    "Bienvenido a QuickCI \nTu gestor de compras inteligente",
                    style: TextStyle(
                        fontSize: 37.0,
                        fontFamily: "Lato",
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              OreangeButton(
                text: "Iniciar con Google",
                onPressed: () {
                  userBloc.signOut();
                  userBloc.signIn().then((FirebaseUser user) {
                    userBloc.updateUserData(User(
                        uid: user.uid,
                        name: user.displayName,
                        email: user.email,
                        photoURL: user.photoUrl));
                  });
                },
                width: MediaQuery.of(context).size.width * 0.75,
                height: 50.0,
              )
            ],
          )
        ],
      ),
    );
  }
}
