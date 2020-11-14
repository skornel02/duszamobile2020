import 'dart:convert';
import 'dart:typed_data';

import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/pojos/car.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarItem extends StatelessWidget {
  final Car car;

  CarItem({this.car});

  @override
  Widget build(BuildContext context) {
    Uint8List imageBytes =
        car.settings.image == null ? null : base64.decode(car.settings.image);

    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          print("Opening car #${car.id}");
          Navigator.pushNamed(context, "/cars/${car.id}");
        },
        child: Wrap(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 150, minHeight: 10),
              child: imageBytes != null
                  ? Image.memory(imageBytes)
                  : Container(
                      height: 2,
                    ),
            ),
            ListTile(
              title: Text(
                car.name,
                style: TextStyle(fontSize: 30),
              ),
              trailing: IconButton(
                icon: Icon(FontAwesomeIcons.removeFormat),
                onPressed: () {
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
                    },
                  );

                  AlertDialog alert = AlertDialog(
                    title: Text(S.of(context).are_you_sure),
                    content: Text(S
                        .of(context)
                        .do_you_want_to(S.of(context).do_remove_car(car.name))),
                    actions: [
                      cancelButton,
                      continueButton,
                    ],
                  );

                  showDialog(
                    context: context,
                    builder: (context) {
                      return alert;
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
