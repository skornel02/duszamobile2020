import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/refuel.dart';
import 'package:duszamobile2020/resources/repair.dart';
import 'package:duszamobile2020/widgets/item_chip.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class RepairForm extends StatefulWidget {
  final Future<void> Function(Repair repair) callback;
  final Repair repair;
  final int milage;
  final List<String> suggestions;
  RepairForm({
    @required this.callback,
    this.repair,
    this.milage,
    this.suggestions,
    Key key,
  }) : super(key: key);

  @override
  _RepairFormState createState() => _RepairFormState();
}

class _RepairFormState extends State<RepairForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _reasonTextEditingController = TextEditingController();
  TextEditingController _descriptionTextEditingController =
      TextEditingController();
  TextEditingController _costTextEditingController = TextEditingController();
  TextEditingController _milageTextEditingController = TextEditingController();

  DateTime date;
  List<String> items = [];
  bool warranty = true;

  @override
  void initState() {
    if (widget.repair != null) {
      _reasonTextEditingController.text = widget.repair.reason;
      _descriptionTextEditingController.text = widget.repair.description;
      _costTextEditingController.text = widget.repair.price.toString();
      if (widget.milage != null){
        _milageTextEditingController.text = widget.milage.toString();
      }


      date = widget.repair.date;
      items = widget.repair.items;
      warranty = widget.repair.warranty;
    } else {
      _costTextEditingController.text = "0";
      print(widget.milage);

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
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    style: TextStyle(fontSize: 18),
                    maxLines: 1,
                    controller: _reasonTextEditingController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: S.of(context).reason,
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(),
                      filled: true,
                      fillColor: Colors.grey.withAlpha(120),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return S
                            .of(context)
                            .cant_be_empty(S.of(context).reason);
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
                    controller: _costTextEditingController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: S.of(context).price,
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(),
                      filled: true,
                      fillColor: Colors.grey.withAlpha(120),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return S.of(context).cant_be_empty(S.of(context).price);
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
                        return S
                            .of(context)
                            .cant_be_empty(S.of(context).milage);
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
                          firstDate:
                              DateTime.now().subtract(Duration(days: 365)),
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
                ),
                CheckboxListTile(
                    title: Text(S.of(context).warranty),
                    value: warranty,
                    onChanged: (val) {
                      setState(() {
                        warranty = !warranty;
                      });
                    }),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Tags(
                    textField: TagsTextField(
                      textStyle: TextStyle(fontSize: 18),
                      constraintSuggestion: false,
                      suggestions: widget.suggestions,
                      onSubmitted: (String str) {
                        setState(() {
                          items.add(str);
                        });
                      },
                    ),
                  ),
                ),
                Tags(

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
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    style: TextStyle(fontSize: 18),
                    maxLines: null,
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
                  ),
                ),
                Spacer(),
                RaisedButton(
                  child: Text(widget.repair == null
                      ? S.of(context).create
                      : S.of(context).save),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      double price =
                          double.parse(_costTextEditingController.text);

                      int milage = int.parse(_milageTextEditingController.text);

                      Repair next;
                      if (widget.repair != null) {
                        next = Repair.from(
                          widget.repair,
                          date: date,
                          milage: milage.round(),
                          price: price,
                          reason: _reasonTextEditingController.text,
                          description: _descriptionTextEditingController.text,
                          items: items,
                          warranty: warranty,
                        );
                      } else {
                        next = Repair.create(
                            id: Uuid().v4(),
                            date: date,
                            milage: milage.round(),
                            price: price,
                            reason: _reasonTextEditingController.text,
                            description: _descriptionTextEditingController.text,
                            items: items,
                            warranty: warranty);
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
