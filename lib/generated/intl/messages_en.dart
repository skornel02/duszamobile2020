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

  static m0(item) => "${item} can\'t be empty!";

  static m1(item, amount) => "${item} can\'t be over ${amount} of characters";

  static m2(name) => "Welcome ${name}!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "add" : MessageLookupByLibrary.simpleMessage("Add"),
    "bought" : MessageLookupByLibrary.simpleMessage("Bought"),
    "add_car" : MessageLookupByLibrary.simpleMessage("Add car"),
    "calendar_synchronisation" : MessageLookupByLibrary.simpleMessage("Calendar synchronisation"),
    "cant_be_empty" : m0,
    "cant_be_over" : m1,
    "car_name" : MessageLookupByLibrary.simpleMessage("Car name"),
    "cheese" : MessageLookupByLibrary.simpleMessage("Cheese"),
    "consumption" : MessageLookupByLibrary.simpleMessage("Consumption"),
    "create" : MessageLookupByLibrary.simpleMessage("Create"),
    "dark_theme" : MessageLookupByLibrary.simpleMessage("Dark theme"),
    "export" : MessageLookupByLibrary.simpleMessage("Export"),
    "google_login" : MessageLookupByLibrary.simpleMessage("Google login"),
    "last_refuel_was_recorded" : MessageLookupByLibrary.simpleMessage("Last refuel was recorded"),
    "liter_price" : MessageLookupByLibrary.simpleMessage("Liter price"),
    "main_page" : MessageLookupByLibrary.simpleMessage("Main page"),
    "milometer" : MessageLookupByLibrary.simpleMessage("Milometer"),
    "monthly" : MessageLookupByLibrary.simpleMessage("Monthly"),
    "more_regions" : MessageLookupByLibrary.simpleMessage("More regions"),
    "other_regions" : MessageLookupByLibrary.simpleMessage("Other regions"),
    "my_cars" : MessageLookupByLibrary.simpleMessage("My cars"),
    "price" : MessageLookupByLibrary.simpleMessage("Price"),
    "region" : MessageLookupByLibrary.simpleMessage("Region"),
    "regional" : MessageLookupByLibrary.simpleMessage("Regional"),
    "synchronise" : MessageLookupByLibrary.simpleMessage("Synchronise"),
    "title" : MessageLookupByLibrary.simpleMessage("Dusza mobile 2020"),
    "type" : MessageLookupByLibrary.simpleMessage("Type"),
    "user_settings" : MessageLookupByLibrary.simpleMessage("User settings"),
    "weekly" : MessageLookupByLibrary.simpleMessage("Weekly"),
    "welcome" : m0,
    "yearly_countrywide" : MessageLookupByLibrary.simpleMessage("Yearly countrywide"),
    "yearly_regional" : MessageLookupByLibrary.simpleMessage("Weekly"),
    "welcome" : m2
  };
}
