import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:quick_ci/User/bloc/user_bloc.dart';
import 'package:quick_ci/User/model/user.dart';

class ProfileHeader extends StatelessWidget {
  User user;
  UserBloc userBloc;
  double screenHeight;
  double screenWidth;
  ProfileHeader(@required this.user);

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return _profileDetails(user);
  }

  Widget _profileDetails(User user) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: screenHeight * 0.3,
          margin:
              EdgeInsets.only(right: 24.0, left: 24.0, top: screenHeight * 0.2),
          padding: EdgeInsets.only(
              left: 14.0, right: 14.0, bottom: 14.0, top: screenHeight * 0.075),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.0),
              shape: BoxShape.rectangle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
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
          child: Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text(
                    user.name,
                    style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: "Lato",
                        color: Colors.black87,
                        fontWeight: FontWeight.w800),
                  ),
                  Container(
                    margin: EdgeInsets.all(4.0),
                    child: Text(
                      user.email,
                      style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: "Lato",
                          color: Colors.black45,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              top: screenHeight * 0.035, bottom: 4.0),
                          child: Text(
                            "Cerrar sesión",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontFamily: "Lato",
                                color: Colors.black38,
                                fontWeight: FontWeight.w600),
                          )),
                      FloatingActionButton(
                          mini: true,
                          splashColor: Colors.blue,
                          child: Icon(Icons.logout),
                          onPressed: () => userBloc.signOut()),
                    ],
                  )
                ],
              )),
        ),
        Container(
            alignment: Alignment.topCenter,
            child: _profilePhoto(user.photoURL)),
      ],
    );
  }

  Widget _profilePhoto(photoURL) {
    return Container(
      width: screenWidth * 0.275,
      height: 120.0,
      margin: EdgeInsets.only(top: screenHeight * 0.125),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white, width: 3.0, style: BorderStyle.solid),
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              //image: AssetImage(user.photoURL)
              image: NetworkImage(photoURL))),
    );
  }
}
