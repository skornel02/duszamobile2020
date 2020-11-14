import 'dart:io';
import 'dart:math';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:duszamobile2020/resources/pojos/car.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';


class CarEditorPage extends StatefulWidget {

  final String mode;

  CarEditorPage(this.mode, {Key key}) : super(key: key);

  @override
  _CarEditorPageState createState() => _CarEditorPageState();
}

class _CarEditorPageState extends State<CarEditorPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTextEditController =
  TextEditingController(text: "Sajt" + Random().nextInt(10).toString());
  TextEditingController _priceTextEditingController = TextEditingController();
  TextEditingController _yearTextEditingController = TextEditingController();

  final _picker = ImagePicker();
  File file;
  String tireType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).car_editor),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - kToolbarHeight,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  RaisedButton(
                      child: Text(S.of(context).change_car),
                      onPressed: (){
                        Navigator.pushNamedAndRemoveUntil(context, "/cars", (a) => false);
                      }),

                  Divider(),

                  Builder(builder: (context) {
                    if (file != null) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 250, height: 160,
                          child: Stack(
                            children: [
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
                                    PickedFile pickedImage =
                                    await _picker.getImage(source: ImageSource.gallery);
                                    if (pickedImage != null) {
                                      setState(() {
                                        file = File(pickedImage.path);
                                      });
                                    }
                                  }
                                ),
                              ),
                            ]
                          ),
                        ),
                      );
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
                          padding: const EdgeInsets.only(top:10),
                          child: TextField(
                            style: TextStyle(fontSize: 18),
                            maxLines: 1,

                            controller: _priceTextEditingController,
                            textInputAction: TextInputAction.next,
                            decoration:
                            InputDecoration(labelText: S.of(context).price,// helperText: "Oktatási azonositó",
                              alignLabelWithHint: true,
                              labelStyle: TextStyle(

                              ),
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

                            controller: _yearTextEditingController,
                            textInputAction: TextInputAction.next,
                            decoration:
                            InputDecoration(labelText: S.of(context).year,
                              alignLabelWithHint: true,
                              labelStyle: TextStyle(

                              ),
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
                                  DropdownMenuItem(child: Text(S.of(context).tire_type_winter), value: "tire_type_winter"),
                                  DropdownMenuItem(child: Text(S.of(context).tire_type_summer), value: "tire_type_summer"),
                                  DropdownMenuItem(child: Text(S.of(context).tire_type_all_year), value: "tire_type_all_year"),
                                  DropdownMenuItem(child: Text(S.of(context).tire_type_other), value: "tire_type_other"),
                                ],
                                onChanged: (val){
                                  setState(() {
                                    tireType = val;
                                  });
                                }
                            )
                          ],
                        ),
                      ],
                    ),
                    iconPlacement: ExpandablePanelIconPlacement.left,

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
          ),
        ),
      ),
    );
  }
}
