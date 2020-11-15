import 'dart:convert';
import 'dart:io';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/car.dart';
import 'package:duszamobile2020/resources/car_settings.dart';
import 'package:duszamobile2020/resources/tire_type.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class CarForm extends StatefulWidget {
  final Future<void> Function(Car car) callback;
  final Car car;

  CarForm({@required this.callback, this.car});

  @override
  _CarFormState createState() => _CarFormState();
}

class _CarFormState extends State<CarForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTextEditController = TextEditingController();
  TextEditingController _priceTextEditingController = TextEditingController();
  TextEditingController _yearTextEditingController = TextEditingController();

  final _picker = ImagePicker();
  File file;
  TireType tireType = TireType.NOT_SPECIFIED;

  @override
  void initState() {
    if (widget.car != null) {
      _nameTextEditController.text = widget.car.name;
      _priceTextEditingController.text = widget.car.settings.cost.toString();
      _yearTextEditingController.text = widget.car.settings.year.toString();
      if (widget.car.settings.image != null) {
        file = File.fromRawPath(base64Decode(widget.car.settings.image));
      }
      tireType = widget.car.tire;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                kToolbarHeight,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  if (widget.car != null)
                    RaisedButton(
                        child: Text(S.of(context).change_car),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/cars", (a) => false);
                        }),
                  if (widget.car != null) Divider(),
                  Builder(builder: (context) {
                    if (file != null) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 250,
                          height: 160,
                          child: Stack(children: [
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 160,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.file(file),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.edit,
                                  ),
                                  onPressed: () async {
                                    PickedFile pickedImage = await _picker
                                        .getImage(source: ImageSource.gallery);
                                    if (pickedImage != null) {
                                      setState(() {
                                        file = File(pickedImage.path);
                                      });
                                    }
                                  }),
                            ),
                          ]),
                        ),
                      );
                    }
                    return IconButton(
                        icon: Icon(
                          FontAwesomeIcons.image,
                        ),
                        iconSize: 80,
                        onPressed: () async {
                          PickedFile pickedImage = await _picker.getImage(
                              source: ImageSource.gallery);
                          if (pickedImage != null) {
                            setState(() {
                              file = File(pickedImage.path);
                            });
                          }
                        });
                  }),
                  TextFormField(
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
                        return S
                            .of(context)
                            .cant_be_empty(S.of(context).car_name);
                      } else if (value.length > 30) {
                        return S
                            .of(context)
                            .cant_be_over(S.of(context).car_name, 30);
                      }
                      return null;
                    },
                    onChanged: (String val) {
                      print(val);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Text("optional"),
                      ],
                    ),
                  ),
                  Divider(),
                  ExpandablePanel(
                    header: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(),
                    ),
                    expanded: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextField(
                            style: TextStyle(fontSize: 18),
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            controller: _priceTextEditingController,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: S
                                  .of(context)
                                  .price, // helperText: "Oktatási azonositó",
                              alignLabelWithHint: true,
                              labelStyle: TextStyle(),
                              filled: true,
                              fillColor: Colors.grey.withAlpha(120),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextField(
                            style: TextStyle(fontSize: 18),
                            maxLines: 1,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            keyboardType: TextInputType.number,
                            controller: _yearTextEditingController,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: S.of(context).year,
                              alignLabelWithHint: true,
                              labelStyle: TextStyle(),
                              filled: true,
                              fillColor: Colors.grey.withAlpha(120),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text("${S.of(context).tire_type}:"),
                            DropdownButton(
                                value: tireType,
                                items: [
                                  DropdownMenuItem(
                                      child:
                                          Text(S.of(context).tire_type_winter),
                                      value: TireType.WINTER),
                                  DropdownMenuItem(
                                      child:
                                          Text(S.of(context).tire_type_summer),
                                      value: TireType.SUMMER),
                                  DropdownMenuItem(
                                      child: Text(
                                          S.of(context).tire_type_all_year),
                                      value: TireType.ALL_YEAR),
                                  DropdownMenuItem(
                                      child:
                                          Text(S.of(context).tire_type_other),
                                      value: TireType.NOT_SPECIFIED),
                                ],
                                onChanged: (val) {
                                  setState(() {
                                    tireType = val;
                                  });
                                })
                          ],
                        ),
                      ],
                    ),
                    iconPlacement: ExpandablePanelIconPlacement.left,
                  ),
                  Spacer(),
                  RaisedButton(
                    child: Text(widget.car == null
                        ? S.of(context).create
                        : S.of(context).save),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        String img;
                        double cost;
                        int year;
                        try {
                          img = base64Encode(file.readAsBytesSync());
                        } catch (_) {}
                        try {
                          cost = double.parse(_priceTextEditingController.text);
                        } catch (_) {}
                        try {
                          year = int.parse(_yearTextEditingController.text);
                        } catch (_) {}

                        Car next;

                        if (widget.car != null) {
                          print("OLD ID: ${widget.car.id}");
                          next = Car.from(
                            widget.car,
                            name: _nameTextEditController.value.text,
                            settings: CarSettings.create(
                                image: img, cost: cost, year: year),
                          );
                          print("NEW ID: ${next.id}");
                        } else {
                          next =
                              Car.fromName(_nameTextEditController.value.text,
                                  settings: CarSettings.create(
                                    image: img,
                                    cost: cost,
                                    year: year,
                                  ),
                                  tire: tireType);
                        }

                        widget.callback(next);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
