// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(item) => "${item} can\'t be empty";

  static m1(item, amount) => "${item} can\'t be over ${amount} of characters";

  static m2(name) => "Welcome ${name}!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "add" : MessageLookupByLibrary.simpleMessage("Add"),
    "add_car" : MessageLookupByLibrary.simpleMessage("Add car"),
    "add_refuel" : MessageLookupByLibrary.simpleMessage("Add refuel"),
    "bought" : MessageLookupByLibrary.simpleMessage("Bought"),
    "calendar_synchronisation" : MessageLookupByLibrary.simpleMessage("Calendar synchronisation"),
    "cant_be_empty" : m0,
    "cant_be_over" : m1,
    "car_editor" : MessageLookupByLibrary.simpleMessage("Car editor"),
    "car_name" : MessageLookupByLibrary.simpleMessage("Car name"),
    "change_car" : MessageLookupByLibrary.simpleMessage("Change car"),
    "cheese" : MessageLookupByLibrary.simpleMessage("Cheese"),
    "consumption" : MessageLookupByLibrary.simpleMessage("Consumption"),
    "create" : MessageLookupByLibrary.simpleMessage("Create"),
    "dark_theme" : MessageLookupByLibrary.simpleMessage("Dark theme"),
    "edit" : MessageLookupByLibrary.simpleMessage("Edit"),
    "edit_car" : MessageLookupByLibrary.simpleMessage("Edit car"),
    "evignettes" : MessageLookupByLibrary.simpleMessage("EVignettes"),
    "export" : MessageLookupByLibrary.simpleMessage("Export"),
    "google_login" : MessageLookupByLibrary.simpleMessage("Google login"),
    "last_refuel_was_recorded" : MessageLookupByLibrary.simpleMessage("Last refuel was recorded"),
    "liter_price" : MessageLookupByLibrary.simpleMessage("Liter price"),
    "main_page" : MessageLookupByLibrary.simpleMessage("Main page"),
    "milometer" : MessageLookupByLibrary.simpleMessage("Milometer"),
    "monthly" : MessageLookupByLibrary.simpleMessage("Monthly"),
    "more_regions" : MessageLookupByLibrary.simpleMessage("More regions"),
    "my_cars" : MessageLookupByLibrary.simpleMessage("My cars"),
    "name" : MessageLookupByLibrary.simpleMessage("Name"),
    "other_regions" : MessageLookupByLibrary.simpleMessage("Other regions"),
    "price" : MessageLookupByLibrary.simpleMessage("Price"),
    "refuels" : MessageLookupByLibrary.simpleMessage("Refuels"),
    "region" : MessageLookupByLibrary.simpleMessage("Region"),
    "regional" : MessageLookupByLibrary.simpleMessage("Regional"),
    "reminders" : MessageLookupByLibrary.simpleMessage("Reminders"),
    "repairs" : MessageLookupByLibrary.simpleMessage("Repairs"),
    "save" : MessageLookupByLibrary.simpleMessage("Save"),
    "statistics" : MessageLookupByLibrary.simpleMessage("Statistics"),
    "synchronise" : MessageLookupByLibrary.simpleMessage("Synchronise"),
    "title" : MessageLookupByLibrary.simpleMessage("Dusza mobile 2020"),
    "type" : MessageLookupByLibrary.simpleMessage("Type"),
    "tyre_type" : MessageLookupByLibrary.simpleMessage("Tyre type"),
    "tyre_type_all_year" : MessageLookupByLibrary.simpleMessage("All year"),
    "tyre_type_other" : MessageLookupByLibrary.simpleMessage("Other"),
    "tyre_type_summer" : MessageLookupByLibrary.simpleMessage("Summer"),
    "tyre_type_winter" : MessageLookupByLibrary.simpleMessage("Winter"),
    "user_settings" : MessageLookupByLibrary.simpleMessage("User settings"),
    "weekly" : MessageLookupByLibrary.simpleMessage("Weekly"),
    "welcome" : m2,
    "year" : MessageLookupByLibrary.simpleMessage("Year"),
    "yearly_countrywide" : MessageLookupByLibrary.simpleMessage("Yearly countrywide"),
    "yearly_regional" : MessageLookupByLibrary.simpleMessage("Weekly")
  };
}
