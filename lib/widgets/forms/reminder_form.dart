import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/reminder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class ReminderForm extends StatefulWidget {
  final Future<void> Function(Reminder reminder) callback;
  final Reminder reminder;
  final int currentMilage;
  ReminderForm({
    @required this.callback,
    this.reminder,
    this.currentMilage,
    Key key,
  }) : super(key: key);

  @override
  _ReminderFormState createState() => _ReminderFormState();
}

class _ReminderFormState extends State<ReminderForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameTextEditingController = TextEditingController();
  TextEditingController _descriptionTextEditingController =
      TextEditingController();
  TextEditingController _afterMilageTextEditingController =
      TextEditingController();
  TextEditingController _milageTextEditingController = TextEditingController();

  List<String> items = [];
  DateTime date = DateTime.now();
  int afterDays = 1;
  bool completed = false;

  String radioValue = "notifyOnDate";

  @override
  void initState() {
    if (widget.reminder != null) {
      _nameTextEditingController.text = widget.reminder.name;
      _descriptionTextEditingController.text = widget.reminder.description;
      if (widget.reminder.afterMilage != null)
        _afterMilageTextEditingController.text =
            widget.reminder.afterMilage.toString();

      items = widget.reminder.items;
      date = widget.reminder.date;
      afterDays = widget.reminder.afterDays ?? 1;
      _milageTextEditingController.text =
          widget.reminder.startMilage.toString();
      completed = widget.reminder.completed;

      if (widget.reminder.afterDays != null &&
          widget.reminder.afterMilage != null) {
        radioValue = "both";
      } else if (widget.reminder.afterDays != null) {
        radioValue = "notifyOnDate";
      } else if (widget.reminder.afterMilage != null) {
        radioValue = "notifyAfterKilometers";
      }

      super.initState();
    } else {
      _milageTextEditingController.text = widget.currentMilage.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  style: TextStyle(fontSize: 18),
                  autofocus: true,
                  maxLines: 1,
                  controller: _nameTextEditingController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: S.of(context).name,
                    alignLabelWithHint: true,
                    labelStyle: TextStyle(),
                    filled: true,
                    fillColor: Colors.grey.withAlpha(120),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return S.of(context).cant_be_empty(S.of(context).name);
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: DateTimeField(
                  initialValue: date,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: S.of(context).date,
                    alignLabelWithHint: true,
                    labelStyle: TextStyle(),
                    filled: true,
                    fillColor: Colors.grey.withAlpha(120),
                  ),
                  format: DateFormat(S.of(context).date_format_to_show),
                  onChanged: (DateTime newDate) {
                    date = newDate;
                  },
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 365 * 5)));
                  },
                  validator: (value) {
                    if (radioValue == "notifyOnDate" || radioValue == "both") {
                      if (value == null) {
                        return S.of(context).cant_be_empty(S.of(context).date);
                      }
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  style: TextStyle(fontSize: 18),
                  maxLines: 1,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  controller: _milageTextEditingController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: S.of(context).milage,
                    alignLabelWithHint: true,
                    labelStyle: TextStyle(),
                    filled: true,
                    fillColor: Colors.grey.withAlpha(120),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return S.of(context).cant_be_empty(S.of(context).milage);
                    }
                    if (int.tryParse(value) == null) {
                      return S
                          .of(context)
                          .cant_be_not_int(S.of(context).milage);
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  style: TextStyle(fontSize: 18),
                  maxLines: 2,
                  maxLength: 200,
                  controller: _descriptionTextEditingController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: S.of(context).description,
                    alignLabelWithHint: true,
                    labelStyle: TextStyle(),
                    filled: true,
                    fillColor: Colors.grey.withAlpha(120),
                  ),
                  validator: (value) {
                    return null;
                  },
                ),
              ),
              Divider(),
              Wrap(
                children: [
                  RadioListTile(
                      groupValue: radioValue,
                      title: Text(S.of(context).notify_on_date),
                      value: "notifyOnDate",
                      onChanged: (val) {
                        setState(() {
                          radioValue = val;
                        });
                      }),
                  RadioListTile(
                      groupValue: radioValue,
                      title: Text(S.of(context).notify_after_kilometers),
                      value: "notifyAfterKilometers",
                      onChanged: (val) {
                        setState(() {
                          radioValue = val;
                        });
                      }),
                  RadioListTile(
                      groupValue: radioValue,
                      title: Text(S.of(context).both),
                      value: "both",
                      onChanged: (val) {
                        setState(() {
                          radioValue = val;
                        });
                      }),
                ],
              ),
              DateTimeField(
                enabled: (radioValue == "notifyOnDate" || radioValue == "both"),
                initialValue: date.add(Duration(days: afterDays)),
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: S.of(context).notify_on_date,
                  alignLabelWithHint: true,
                  labelStyle: TextStyle(),
                  filled: true,
                  fillColor: Colors.grey.withAlpha(120),
                ),
                format: DateFormat(S.of(context).date_format_to_show),
                onChanged: (DateTime newDate) {
                  afterDays = newDate.difference(date).inDays + 1;
                },
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365)));
                },
                validator: (value) {
                  if (radioValue == "notifyAfterKilometers") return null;

                  if (afterDays < 1) {
                    return S.of(context).cant_be_before(
                        S.of(context).notify_on_date, S.of(context).date);
                  }
                  return null;
                },
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  enabled: !(radioValue == "notifyOnDate"),
                  style: TextStyle(fontSize: 18),
                  maxLines: 1,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  controller: _afterMilageTextEditingController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: S.of(context).after_milage,
                    alignLabelWithHint: true,
                    labelStyle: TextStyle(),
                    filled: true,
                    fillColor: Colors.grey.withAlpha(120),
                  ),
                  validator: (value) {
                    if (radioValue == "notifyOnDate") return null;
                    if (value.isEmpty) {
                      return S.of(context).cant_be_empty(S.of(context).milage);
                    }
                    return null;
                  },
                ),
              ),
              Tags(
                textField: TagsTextField(
                  textStyle: TextStyle(fontSize: 18),
                  constraintSuggestion: false,
                  onSubmitted: (String str) {
                    setState(() {
                      items.add(str);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Tags(
                    itemCount: items.length,
                    itemBuilder: (int index) {
                      final item = items[index];
                      return ItemTags(
                        pressEnabled: false,
                        key: Key(index.toString()),
                        index: index,
                        title: item,
                        active: true,
                        textStyle: TextStyle(
                          fontSize: 16,
                        ),
                        removeButton: ItemTagsRemoveButton(
                          onRemoved: () {
                            setState(() {
                              items.removeAt(index);
                            });
                            return true;
                          },
                        ),
                        onPressed: (item) => print(item),
                        onLongPressed: (item) => print(item),
                      );
                    }),
              ),
              RaisedButton(
                child: Text(widget.reminder == null
                    ? S.of(context).create
                    : S.of(context).save),
                onPressed: () {
                  print("form");
                  if (_formKey.currentState.validate()) {
                    print("valid");

                    print(radioValue);
                    int afterMilage = radioValue == "notifyOnDate"
                        ? null
                        : int.parse(_afterMilageTextEditingController.text);

                    int startMilage =
                        int.parse(_milageTextEditingController.text);
                    int realAfterDays = radioValue == "notifyAfterKilometers"
                        ? null
                        : afterDays;

                    print(
                        "afterMilage: $afterMilage realAfterDays: $realAfterDays");

                    Reminder next;
                    if (widget.reminder != null) {
                      next = Reminder.from(
                        widget.reminder,
                        name: _nameTextEditingController.text,
                        description: _descriptionTextEditingController.text,
                        date: date,
                        items: items,
                        startMilage: startMilage,
                        afterMilage: afterMilage,
                        afterDays: realAfterDays,
                        completed: completed,
                      );
                    } else {
                      next = Reminder.create(
                        id: Uuid().v4(),
                        name: _nameTextEditingController.text,
                        description: _descriptionTextEditingController.text,
                        date: date,
                        items: items,
                        startMilage: startMilage,
                        afterMilage: afterMilage,
                        afterDays: realAfterDays,
                        completed: completed,
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
    );
  }
}
