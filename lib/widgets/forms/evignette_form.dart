import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:duszamobile2020/alerts.dart';
import 'package:duszamobile2020/blocs/car_bloc/car_bloc.dart';
import 'package:duszamobile2020/constants/evignette_constants.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/e_vignette.dart';
import 'package:duszamobile2020/resources/reminder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class EVignetteForm extends StatefulWidget {
  final Future<void> Function(EVignette eVignette) callback;
  final EVignette eVignette;
  EVignetteForm({@required this.callback, this.eVignette, Key key})
      : super(key: key);

  @override
  _EVignetteFormState createState() => _EVignetteFormState();
}

class _EVignetteFormState extends State<EVignetteForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime startDate;
  int duration = 7;
  String area;

  String currentExpiration = "expiration_weekly_country";
  String currentCounty;

  @override
  void initState() {
    if (widget.eVignette != null) {
      startDate = widget.eVignette.start;
      duration = widget.eVignette.duration;
      area = widget.eVignette.area;
    } else {
      area = "Országos";
    }
    currentCounty = area;
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
              kToolbarHeight * 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("${S.of(context).expiration}:"),
                    DropdownButton(
                        value: currentExpiration,
                        items: [
                          DropdownMenuItem(
                              child: Text(S.of(context).expiration_weekly),
                              value: "expiration_weekly_country"),
                          DropdownMenuItem(
                              child: Text(S.of(context).expiration_monthly),
                              value: "expiration_monthly_country"),
                          DropdownMenuItem(
                              child: Text(S.of(context).expiration_yearly),
                              value: "expiration_yearly_country"),
                        ],
                        onChanged: (val) {
                          setState(() {
                            if (currentExpiration ==
                                "expiration_yearly_country") {
                              duration = 365;
                            } else if (currentExpiration ==
                                "expiration_monthly_country") {
                              duration = 31;
                            } else if (currentExpiration ==
                                "expiration_weekly_country") {
                              duration = 7;
                            }
                            currentExpiration = val;
                          });
                        })
                  ],
                ),
                Row(
                  children: [
                    Text("${S.of(context).county}:"),
                    Builder(
                      builder: (c) {
                        List<DropdownMenuItem> items = [];
                        items.add(DropdownMenuItem(
                          child: Text("Országos"),
                          value: "Országos",
                        ));
                        for (String s in supportedCounty) {
                          items.add(DropdownMenuItem(
                            child: Text(s),
                            value: s,
                          ));
                        }

                        return DropdownButton(
                            value: currentCounty,
                            disabledHint:
                                Text(S.of(context).only_annual_for_county),
                            items:
                                currentExpiration == "expiration_yearly_country"
                                    ? items
                                    : null,
                            onChanged: (val) {
                              setState(() {
                                currentCounty = val;
                              });
                            });
                      },
                    )
                  ],
                ),
                DateTimeField(
                  initialValue: startDate,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: S.of(context).date,
                    alignLabelWithHint: true,
                    labelStyle: TextStyle(),
                    filled: true,
                    fillColor: Colors.grey.withAlpha(120),
                  ),
                  format: DateFormat(S.of(context).date_format),
                  onChanged: (DateTime newDate) {
                    startDate = newDate;
                  },
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate:
                            DateTime.now().subtract(Duration(days: 365 * 5)),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime.now());
                  },
                  validator: (value) {
                    if (value == null) {
                      return S
                          .of(context)
                          .cant_be_invalid_date(S.of(context).date);
                    }
                    return null;
                  },
                ),
                Spacer(),
                RaisedButton(
                  child: Text(widget.eVignette == null
                      ? S.of(context).create
                      : S.of(context).save),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      if (currentExpiration != "expiration_yearly_country") {
                        area = "Országos";
                      } else {
                        area = currentCounty;
                      }
                      EVignette next;
                      if (widget.eVignette != null) {
                        next = EVignette.from(
                          widget.eVignette,
                          start: startDate,
                          area: area,
                          duration: duration,
                        );
                      } else {
                        next = EVignette.create(
                          id: Uuid().v4(),
                          start: startDate,
                          area: area,
                          duration: duration,
                        );
                      }
                      if (widget.eVignette == null) {
                        await showConfirmAlert(
                          context,
                          title: S.of(context).suggestion,
                          description: S.of(context).remind_about_e_vignette,
                          onAccept: () {
                            Reminder reminder = Reminder.create(
                              id: Uuid().v4(),
                              name: S
                                  .of(context)
                                  .e_vignette_expiration_reminder(area),
                              description:
                                  "/${S.of(context).automatically_generated}/",
                              items: ["E-Vignette"],
                              date: startDate,
                              afterDays: duration,
                              startMilage: 0,
                              completed: false,
                            );
                            BlocProvider.of<CarBloc>(context)
                                .add(SaveReminderItem(reminder));
                          },
                        );
                      }
                      widget.callback(next);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
