import 'package:flutter/material.dart';

Future<void> showConfirmAlert(BuildContext context,
    {String title, String description, Function onAccept}) {
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Continue"),
    onPressed: () {
      Navigator.of(context).pop();
      onAccept();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(description),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  return showDialog(
    context: context,
    builder: (context) {
      return alert;
    },
  );
}
