import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:quick_ci/User/bloc/user_bloc.dart';
import 'package:quick_ci/sign_in_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
            theme: ThemeData(
                brightness: Brightness.light,
                primaryColor: Color(0xFF3F51B5),
                primaryColorDark: Color(0xFF303F9F),
                accentColor: Color(0xFFFF5722)),
            title: 'QuickCI',
            home: SignInScreen()),
        bloc: UserBloc());
  }
}
