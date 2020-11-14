import 'dart:io';

import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:duszamobile2020/resources/pojos/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class CarCreateForm extends StatefulWidget {
  @override
  _CarCreateFormState createState() => _CarCreateFormState();
}

class _CarCreateFormState extends State<CarCreateForm> {
  final _formKey = GlobalKey<FormState>();
  final _inputKey = GlobalKey(debugLabel: "Input");
  final TextEditingController textEditingControllerName =
      TextEditingController(text: "Sajt");

  final _picker = ImagePicker();
  File file;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Builder(builder: (context) {
            if (file != null) {
              return Image.file(file);
            }
            return IconButton(
                icon: Icon(
                  FontAwesomeIcons.image,
                ),
                iconSize: 80,
                onPressed: () async {
                  PickedFile pickedImage =
                      await _picker.getImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    setState(() {
                      file = File(pickedImage.path);
                    });
                  }
                });
          }),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextFormField(
              key: _inputKey,
              autofocus: true,
              style: TextStyle(fontSize: 18),
              maxLines: 1,
              controller: textEditingControllerName,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Név",
                alignLabelWithHint: true,
                labelStyle: TextStyle(),
                filled: true,
                fillColor: Colors.grey.withAlpha(120),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return S.of(context).cant_be_empty(S.of(context).car_name);
                } else if (value.length > 30) {
                  return S.of(context).cant_be_over(S.of(context).car_name, 30);
                }
                return null;
              },
            ),
          ),
          Spacer(),
          RaisedButton(
            child: Text(S.of(context).create),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                final repository =
                    RepositoryProvider.of<CarRepository>(context);
                Car car = Car.fromName(textEditingControllerName.value.text);
                repository.updateCar(car);
              }
            },
          ),
        ],
      ),
    );
  }
}
