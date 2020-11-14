import 'dart:io';
import 'dart:math';

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
  final TextEditingController _nameTextEditController =
      TextEditingController(text: "Sajt" + Random().nextInt(10).toString());

  final _picker = ImagePicker();
  File file;
  String tyreType;


  @override
  void initState() {
    _nameTextEditController.addListener(() {
      print("CONTROLLER: $_nameTextEditController");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
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
            TextFormField(
              autofocus: true,
              style: TextStyle(fontSize: 18),
              maxLines: 1,
              controller: _nameTextEditController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: S.of(context).name,
                alignLabelWithHint: true,
                labelStyle: TextStyle(),
                filled: true,
                fillColor: Colors.grey.withAlpha(120),
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return S.of(context).cant_be_empty(S.of(context).car_name);
                } else if (value.length > 30) {
                  return S.of(context).cant_be_over(S.of(context).car_name, 30);
                }
                return null;
              },
              onChanged: (String val) {
                print(val);
              },
            ),

            Row(
              children: [
                Text("${S.of(context).tyre_type}:"),
                DropdownButton(
                    value: tyreType,
                    items: [
                      DropdownMenuItem(child: Text(S.of(context).tyre_type_winter), value: "tyre_type_winter"),
                      DropdownMenuItem(child: Text(S.of(context).tyre_type_summer), value: "tyre_type_summer"),
                      DropdownMenuItem(child: Text(S.of(context).tyre_type_all_year), value: "tyre_type_all_year"),
                      DropdownMenuItem(child: Text(S.of(context).tyre_type_other), value: "tyre_type_other"),
                    ],
                    onChanged: (val){
                      setState(() {
                        tyreType = val;
                      });
                    }
                )
              ],
            ),

            Spacer(),
            RaisedButton(
              child: Text(S.of(context).create),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  final repository =
                      RepositoryProvider.of<CarRepository>(context);
                  Car car = Car.fromName(_nameTextEditController.value.text);
                  repository.updateCar(car);
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/cars/" + car.id, (a) => false);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
