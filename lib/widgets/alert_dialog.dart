import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, String textConfirmButton, String title,
    String content) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text(textConfirmButton),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
