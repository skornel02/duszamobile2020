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
    "add_car" : MessageLookupByLibrary.simpleMessage("Add car"),
    "cant_be_empty" : m0,
    "cant_be_over" : m1,
    "car_name" : MessageLookupByLibrary.simpleMessage("Car name"),
    "cheese" : MessageLookupByLibrary.simpleMessage("Cheese"),
    "create" : MessageLookupByLibrary.simpleMessage("Create"),
    "main_page" : MessageLookupByLibrary.simpleMessage("Main page"),
    "my_cars" : MessageLookupByLibrary.simpleMessage("My cars"),
    "title" : MessageLookupByLibrary.simpleMessage("Dusza mobile 2020"),
    "welcome" : m2
  };
}
