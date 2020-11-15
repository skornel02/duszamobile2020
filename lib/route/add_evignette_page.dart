import 'package:duszamobile2020/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddEVignettePage extends StatefulWidget {
  AddEVignettePage({Key key}) : super(key: key);

  @override
  _AddRefuelPageState createState() => _AddRefuelPageState();
}

class _AddRefuelPageState extends State<AddEVignettePage> {
  TextEditingController textEditingControllerName = TextEditingController();
  TextEditingController textEditingControllerDescription =
      TextEditingController();
  TextEditingController textEditingControllerYear = TextEditingController();

  String selectedType = "Karbantartás";

  bool remindMeDate = false;
  bool remindMeMilage = true;

  double refuelAmount = 15;

  String type;
  String region;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Autúpálya matrica hozzáadása"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Column(
                children: [
                  RadioListTile(
                    value: "Karbantartás",
                    groupValue: selectedType,
                    title: Text("Karbantartás"),
                    onChanged: (val) {
                      setState(() {
                        selectedType = val;
                      });
                    },
                    activeColor: Colors.red,
                  ),
                  RadioListTile(
                    value: "Biztositas",
                    groupValue: selectedType,
                    title: Text("Biztositas"),
                    onChanged: (val) {
                      setState(() {
                        selectedType = val;
                      });
                    },
                    activeColor: Colors.red,
                  ),
                  RadioListTile(
                    value: "Abroncs",
                    groupValue: selectedType,
                    title: Text("Abroncs"),
                    onChanged: (val) {
                      setState(() {
                        selectedType = val;
                      });
                    },
                    activeColor: Colors.red,
                  ),
                  RadioListTile(
                    value: "Egyéb",
                    groupValue: selectedType,
                    title: Text("Egyéb"),
                    onChanged: (val) {
                      setState(() {
                        selectedType = val;
                      });
                    },
                    activeColor: Colors.red,
                  ),
                ],
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                  autofocus: true,
                  style: TextStyle(fontSize: 18),
                  maxLines: 1,
                  controller: textEditingControllerName,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Név", // helperText: "Oktatási azonositó",
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
                  controller: textEditingControllerDescription,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Leírás", // helperText: "Oktatási azonositó",
                    alignLabelWithHint: true,
                    labelStyle: TextStyle(),
                    filled: true,
                    fillColor: Colors.grey.withAlpha(120),
                  ),
                ),
              ),
              Row(
                children: [
                  Text("${S.of(context).type}:"),
                  DropdownButton(
                      value: type,
                      items: [
                        DropdownMenuItem(
                            child: Text(S.of(context).weekly), value: "weekly"),
                        DropdownMenuItem(
                            child: Text(S.of(context).monthly),
                            value: "monthly"),
                        DropdownMenuItem(
                            child: Text(S.of(context).yearly_countrywide),
                            value: "yearly_countrywide"),
                        DropdownMenuItem(
                            child: Text(S.of(context).yearly_regional),
                            value: "yearly_regional"),
                      ],
                      onChanged: (val) {
                        setState(() {
                          type = val;
                        });
                      })
                ],
              ),
              Row(
                children: [
                  Text("${S.of(context).region}:"),
                  DropdownButton(
                      value: region,
                      items: [
                        DropdownMenuItem(
                            child: Text(S.of(context).other_regions),
                            value: "other_regions"),
                        DropdownMenuItem(
                            child: Text(S.of(context).more_regions),
                            value: "more_regions"),
                      ],
                      onChanged: (val) {
                        setState(() {
                          region = val;
                        });
                      })
                ],
              ),
              Text("${S.of(context).bought}:"),
              InputDatePickerFormField(
                firstDate: DateTime.now().subtract(Duration(days: 365)),
                lastDate: DateTime.now(),
                onDateSaved: (DateTime date) {},
              ),
              RaisedButton(
                child: Text(S.of(context).add),
                onPressed: () {
                  // notify bloc
                },
              ),
            ],
          ),
        ));
  }
}
