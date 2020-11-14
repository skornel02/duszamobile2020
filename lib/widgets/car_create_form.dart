import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:duszamobile2020/resources/pojos/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarCreateForm extends StatefulWidget {
  @override
  _CarCreateFormState createState() => _CarCreateFormState();
}

class _CarCreateFormState extends State<CarCreateForm> {
  final _formKey = GlobalKey<FormState>();
  final _inputKey = GlobalKey(debugLabel: "Input");
  final TextEditingController textEditingControllerName =
      TextEditingController(text: "Sajt");

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false
                    // otherwise.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, display a Snackbar.
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
          IconButton(
              icon: Icon(
                FontAwesomeIcons.image,
              ),
              iconSize: 80,
              onPressed: () {
                // add image of car
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
