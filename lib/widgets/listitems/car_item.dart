import 'dart:convert';
import 'dart:typed_data';

import 'package:duszamobile2020/alerts.dart';
import 'package:duszamobile2020/blocs/cars_bloc/cars_bloc.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/repository/preference_repository.dart';
import 'package:duszamobile2020/resources/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarItem extends StatelessWidget {
  final Car car;

  CarItem({this.car});

  void _onOpen(BuildContext context) async {
    print("Opening car #${car.id}");
    await setSelectedCar(car.id);
    Navigator.pushNamed(context, "/cars/${car.id}");
  }

  void _onRemove(BuildContext context) {
    showConfirmAlert(
      context,
      title: S.of(context).are_you_sure,
      description:
          S.of(context).do_you_want_to(S.of(context).do_remove_car(car.name)),
      onAccept: () {
        BlocProvider.of<CarsBloc>(context).add(RemoveCar(car.id));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Uint8List imageBytes =
        car.settings.image == null ? null : base64.decode(car.settings.image);

    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () => _onOpen(context),
        child: Wrap(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 150, minHeight: 10),
              child: imageBytes != null
                  ? Center(child: Image.memory(imageBytes))
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
                onPressed: () => _onRemove(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
