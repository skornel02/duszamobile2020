import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/resources/refuel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class RefuelForm extends StatefulWidget {
  final Future<void> Function(Refuel refuel) callback;
  final Refuel refuel;
  final List<Refuel> refuels;
  RefuelForm({@required this.callback, this.refuel, this.refuels, Key key})
      : super(key: key);

  @override
  _RefuelFormState createState() => _RefuelFormState();
}

class _RefuelFormState extends State<RefuelForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _refuelTextEditingController = TextEditingController();
  TextEditingController _priceTextEditingController = TextEditingController();
  TextEditingController _milageTextEditingController = TextEditingController();
  TextEditingController _lastMilageTextEditingController =
      TextEditingController();

  double literPrice = 0;
  double consumption = 0;

  bool autoFillLastRecord;
  DateTime date;

  @override
  void initState() {
    autoFillLastRecord = widget.refuels != null && widget.refuels.isNotEmpty;

    if (widget.refuel != null) {
      _refuelTextEditingController.text = widget.refuel.refueled.toString();
      _priceTextEditingController.text = widget.refuel.paid.toString();
      _milageTextEditingController.text = widget.refuel.milage.toString();
      _lastMilageTextEditingController.text =
          widget.refuel.lastMilage.toString();
      autoFillLastRecord = false;
      date = widget.refuel.date;
    }

    if (autoFillLastRecord) {
      _doCalculateAutoFill();
    }

    _refuelTextEditingController.addListener(() {
      setState(() {
        _doCalculateConsumption();
        _doCalculateLiterPrice();
      });
    });
    _priceTextEditingController.addListener(() {
      setState(() {
        _doCalculateConsumption();
        _doCalculateLiterPrice();
      });
    });
    _milageTextEditingController.addListener(() {
      setState(() {
        _doCalculateConsumption();
      });
    });
    _lastMilageTextEditingController.addListener(() {
      setState(() {
        _doCalculateConsumption();
      });
    });

    _doCalculateConsumption();
    _doCalculateLiterPrice();

    super.initState();
  }

  _doCalculateAutoFill() {
    List<Refuel> refuels = widget.refuels;
    int maxMilage = -1;
    for (var refuel in refuels) {
      if (refuel.milage > maxMilage) maxMilage = refuel.milage;
    }
    _lastMilageTextEditingController.text = maxMilage.toString();
  }

  _doCalculateLiterPrice() {
    double price = double.tryParse(_priceTextEditingController.text) ?? 0;
    double fuel = double.tryParse(_refuelTextEditingController.text) ?? 0;

    literPrice = price / fuel;
  }

  _doCalculateConsumption() {
    int milage = int.tryParse(_milageTextEditingController.text) ?? 0;
    int lastMilage = int.tryParse(_lastMilageTextEditingController.text) ?? 0;
    double fuel = double.tryParse(_refuelTextEditingController.text) ?? 0;
    consumption = fuel / ((milage - lastMilage) / 100);
  }

  @override
  Widget build(BuildContext context) {
    print("AUTOFILL: $autoFillLastRecord");

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
                DateTimeField(
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
                        firstDate: DateTime.now().subtract(Duration(days: 365)),
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
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    style: TextStyle(fontSize: 18),
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    controller: _refuelTextEditingController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: S.of(context).refuel,
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(),
                      filled: true,
                      fillColor: Colors.grey.withAlpha(120),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return S
                            .of(context)
                            .cant_be_empty(S.of(context).refuel);
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
                    controller: _priceTextEditingController,
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
                      if (int.tryParse(value) != null &&
                          int.tryParse(_lastMilageTextEditingController.text) !=
                              null &&
                          int.parse(value) <=
                              int.parse(
                                  _lastMilageTextEditingController.text)) {
                        return S.of(context).cant_be_smaller(
                            S.of(context).milage, S.of(context).last_milage);
                      }

                      return null;
                    },
                  ),
                ),
                CheckboxListTile(
                    title: Text(S.of(context).last_refuel_was_recorded),
                    value: widget.refuels != null &&
                        widget.refuels.isNotEmpty &&
                        autoFillLastRecord,
                    onChanged: (val) {
                      setState(() {
                        if (widget.refuels == null || widget.refuels.isEmpty)
                          return null;
                        autoFillLastRecord = val;
                        if (autoFillLastRecord) _doCalculateAutoFill();
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    enabled: !autoFillLastRecord,
                    style: TextStyle(fontSize: 18),
                    maxLines: 1,
                    controller: _lastMilageTextEditingController,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: S.of(context).last_milage,
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(),
                      filled: true,
                      fillColor: Colors.grey.withAlpha(120),
                    ),
                    validator: (value) {
                      if (int.tryParse(value) == null)
                        return S
                            .of(context)
                            .cant_be_not_int(S.of(context).last_milage);
                      return null;
                    },
                  ),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(S
                        .of(context)
                        .liter_price(literPrice.toStringAsFixed(2))),
                    Text(S
                        .of(context)
                        .consumption(consumption.toStringAsFixed(2))),
                  ],
                ),
                Spacer(),
                RaisedButton(
                  child: Text(widget.refuel == null
                      ? S.of(context).create
                      : S.of(context).save),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      double cost = 0;
                      int milage = 0;
                      int lastMilage = 0;
                      double refuelAmount = double.parse(
                          double.parse(_refuelTextEditingController.text)
                              .toStringAsFixed(1));

                      try {
                        cost = double.parse(_priceTextEditingController.text);
                      } catch (_) {}

                      try {
                        milage = int.parse(_milageTextEditingController.text);
                      } catch (_) {}
                      try {
                        lastMilage =
                            int.parse(_lastMilageTextEditingController.text);
                      } catch (_) {}

                      Refuel next;

                      if (widget.refuel != null) {
                        next = Refuel.from(
                          widget.refuel,
                          date: date,
                          refueled: refuelAmount,
                          paid: cost,
                          milage: milage,
                          lastMilage: lastMilage,
                        );
                      } else {
                        next = Refuel.create(
                          id: Uuid().v4(),
                          date: date,
                          refueled: refuelAmount,
                          paid: cost,
                          milage: milage,
                          lastMilage: lastMilage,
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
