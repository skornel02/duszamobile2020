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

  static m0(targetDate, date) => "${targetDate} must be after ${date}";

  static m1(item) => "${item} can\'t be empty!";

  static m2(item) => "${item} must have a valid date";

  static m3(item) => "${item} must be a valid number";

  static m4(item) => "${item} must be a valid integer";

  static m5(item, amount) => "${item} can\'t be over ${amount} of characters";

  static m6(item, otherItem) => "${item} must be bigger than ${otherItem}";

  static m7(name) => "Are you sure you want to complete \'${name}\'?";

  static m8(efficiency) => "Efficiency: ${efficiency} l/100km";

  static m9(efficiency) => "${efficiency} \$";

  static m10(car_name) => "remove car \'${car_name}\'";

  static m11(date) => "remove E-Vignette valid from ${date}";

  static m12(date) => "remove refuel log at ${date}";

  static m13(title) => "remove reminder with title \'${title}\'";

  static m14(date) => "remove repair log at ${date}";

  static m15(do_something) => "You dou want to ${do_something}?";

  static m16(area) => "[E-Vignette] ${area} will expire";

  static m17(date) => "Valid until ${date}";

  static m18(area, time) => "Last ${area} change: ${time}";

  static m19(price) => "Liter price: ${price} \$";

  static m20(date, title) => "Your reminder set for ${date} has expired! ${title}";

  static m21(title) => "Check your reminder: ${title}";

  static m22(milage, title) => "Your milage goal ${milage} is over! ${title}";

  static m23(carName) => "Refuels - ${carName}";

  static m24(item, amount) => "${item}: ${amount} \$";

  static m25(name) => "Welcome ${name}!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "active" : MessageLookupByLibrary.simpleMessage("Active"),
    "add" : MessageLookupByLibrary.simpleMessage("Add"),
    "add_car" : MessageLookupByLibrary.simpleMessage("Add car"),
    "add_evignette" : MessageLookupByLibrary.simpleMessage("Add eVignette"),
    "add_refuel" : MessageLookupByLibrary.simpleMessage("Add refuel"),
    "add_reminder" : MessageLookupByLibrary.simpleMessage("Add reminder"),
    "add_repair" : MessageLookupByLibrary.simpleMessage("Add repair"),
    "after_milage" : MessageLookupByLibrary.simpleMessage("After milage"),
    "are_you_sure" : MessageLookupByLibrary.simpleMessage("Are you sure?"),
    "automatically_generated" : MessageLookupByLibrary.simpleMessage("Automatically generated"),
    "back_to_cars_menuitem" : MessageLookupByLibrary.simpleMessage("Choose different car"),
    "both" : MessageLookupByLibrary.simpleMessage("Both"),
    "bought" : MessageLookupByLibrary.simpleMessage("Bought"),
    "calendar_synchronisation" : MessageLookupByLibrary.simpleMessage("Calendar synchronisation"),
    "cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "cant_be_before" : m0,
    "cant_be_empty" : m1,
    "cant_be_invalid_date" : m2,
    "cant_be_not_double" : m3,
    "cant_be_not_int" : m4,
    "cant_be_over" : m5,
    "cant_be_smaller" : m6,
    "car_editor" : MessageLookupByLibrary.simpleMessage("Car editor"),
    "car_name" : MessageLookupByLibrary.simpleMessage("Car name"),
    "car_settings" : MessageLookupByLibrary.simpleMessage("Car settings"),
    "car_settings_page_menuitem" : MessageLookupByLibrary.simpleMessage("Car settings"),
    "change_car" : MessageLookupByLibrary.simpleMessage("Change car"),
    "cheese" : MessageLookupByLibrary.simpleMessage("Cheese"),
    "complete_reminder" : m7,
    "consumption" : m8,
    "consumption_label" : MessageLookupByLibrary.simpleMessage("Consumption in liter/100km"),
    "county" : MessageLookupByLibrary.simpleMessage("County"),
    "create" : MessageLookupByLibrary.simpleMessage("Create"),
    "currency" : m9,
    "dark_theme" : MessageLookupByLibrary.simpleMessage("Dark theme"),
    "date" : MessageLookupByLibrary.simpleMessage("Date"),
    "date_format" : MessageLookupByLibrary.simpleMessage("dd-MM-yyyy"),
    "date_format_to_show" : MessageLookupByLibrary.simpleMessage("yyyy.MM.dd"),
    "description" : MessageLookupByLibrary.simpleMessage("Description"),
    "do_remove_car" : m10,
    "do_remove_e_vignette" : m11,
    "do_remove_refuel" : m12,
    "do_remove_reminder" : m13,
    "do_remove_repair" : m14,
    "do_you_want_to" : m15,
    "e_vignette_expiration_reminder" : m16,
    "e_vignette_page_menuitem" : MessageLookupByLibrary.simpleMessage("E-Vignettes"),
    "edit" : MessageLookupByLibrary.simpleMessage("Edit"),
    "edit_car" : MessageLookupByLibrary.simpleMessage("Edit car"),
    "edit_refuel" : MessageLookupByLibrary.simpleMessage("Edit refuel"),
    "edit_reminder" : MessageLookupByLibrary.simpleMessage("Edit reminder"),
    "edit_repair" : MessageLookupByLibrary.simpleMessage("Edit repair"),
    "evignettes" : MessageLookupByLibrary.simpleMessage("EVignettes"),
    "expiration" : MessageLookupByLibrary.simpleMessage("Expiration"),
    "expiration_date" : m17,
    "expiration_monthly" : MessageLookupByLibrary.simpleMessage("Monthly"),
    "expiration_weekly" : MessageLookupByLibrary.simpleMessage("Weekly"),
    "expiration_yearly" : MessageLookupByLibrary.simpleMessage("Annual"),
    "expired" : MessageLookupByLibrary.simpleMessage("Expired"),
    "export" : MessageLookupByLibrary.simpleMessage("Export"),
    "google_login" : MessageLookupByLibrary.simpleMessage("Google login"),
    "last_change" : m18,
    "last_milage" : MessageLookupByLibrary.simpleMessage("Last refuel milage"),
    "last_refuel_was_recorded" : MessageLookupByLibrary.simpleMessage("Last refuel was recorded"),
    "liter_price" : m19,
    "local_area" : MessageLookupByLibrary.simpleMessage("local"),
    "main_page" : MessageLookupByLibrary.simpleMessage("Main page"),
    "milage" : MessageLookupByLibrary.simpleMessage("Current milage"),
    "milometer" : MessageLookupByLibrary.simpleMessage("Milometer"),
    "monthly" : MessageLookupByLibrary.simpleMessage("Monthly"),
    "more_regions" : MessageLookupByLibrary.simpleMessage("More regions"),
    "my_cars" : MessageLookupByLibrary.simpleMessage("My cars"),
    "name" : MessageLookupByLibrary.simpleMessage("Name"),
    "no" : MessageLookupByLibrary.simpleMessage("No"),
    "notification_date" : m20,
    "notification_date_and_milage" : m21,
    "notification_milage" : m22,
    "notify_after_kilometers" : MessageLookupByLibrary.simpleMessage("Notify after kilometers"),
    "notify_on_date" : MessageLookupByLibrary.simpleMessage("Notify on date"),
    "only_annual_for_county" : MessageLookupByLibrary.simpleMessage("Only country wide available"),
    "other_regions" : MessageLookupByLibrary.simpleMessage("Other regions"),
    "petrol_price_over_time" : MessageLookupByLibrary.simpleMessage("Petrol price change"),
    "price" : MessageLookupByLibrary.simpleMessage("Price"),
    "reason" : MessageLookupByLibrary.simpleMessage("Reason"),
    "refuel" : MessageLookupByLibrary.simpleMessage("Refuel"),
    "refuels" : MessageLookupByLibrary.simpleMessage("Refuels"),
    "refuels_page_menuitem" : MessageLookupByLibrary.simpleMessage("Refuels"),
    "refuels_page_title" : m23,
    "region" : MessageLookupByLibrary.simpleMessage("Region"),
    "regional" : MessageLookupByLibrary.simpleMessage("Regional"),
    "remind_about_e_vignette" : MessageLookupByLibrary.simpleMessage("Do you want to create a reminder when the E-Vignette expires?"),
    "reminders" : MessageLookupByLibrary.simpleMessage("Reminders"),
    "reminders_page_menuitem" : MessageLookupByLibrary.simpleMessage("Reminders"),
    "remote_area" : MessageLookupByLibrary.simpleMessage("remote"),
    "repairs" : MessageLookupByLibrary.simpleMessage("Repairs"),
    "repairs_page_menuitem" : MessageLookupByLibrary.simpleMessage("Repairs"),
    "repeat_this_reminder_again" : MessageLookupByLibrary.simpleMessage("Do you want to repeat this reminder?"),
    "save" : MessageLookupByLibrary.simpleMessage("Save"),
    "spending_format" : m24,
    "statistics" : MessageLookupByLibrary.simpleMessage("Statistics"),
    "statistics_page_menuitem" : MessageLookupByLibrary.simpleMessage("Statistics"),
    "suggestion" : MessageLookupByLibrary.simpleMessage("Suggestion"),
    "synchronise" : MessageLookupByLibrary.simpleMessage("Synchronize"),
    "time_format" : MessageLookupByLibrary.simpleMessage("yyyy-MM-dd – kk:mm"),
    "tire_type" : MessageLookupByLibrary.simpleMessage("Tyre type"),
    "tire_type_all_year" : MessageLookupByLibrary.simpleMessage("All year"),
    "tire_type_other" : MessageLookupByLibrary.simpleMessage("Other"),
    "tire_type_summer" : MessageLookupByLibrary.simpleMessage("Summer"),
    "tire_type_winter" : MessageLookupByLibrary.simpleMessage("Winter"),
    "title" : MessageLookupByLibrary.simpleMessage("Dusza mobile 2020"),
    "total_spending" : MessageLookupByLibrary.simpleMessage("Total spending"),
    "type" : MessageLookupByLibrary.simpleMessage("Type"),
    "upcoming" : MessageLookupByLibrary.simpleMessage("Upcoming"),
    "user_settings" : MessageLookupByLibrary.simpleMessage("User settings"),
    "user_settings_page_menuitem" : MessageLookupByLibrary.simpleMessage("User/App settings"),
    "warranty" : MessageLookupByLibrary.simpleMessage("Under warranty"),
    "weekly" : MessageLookupByLibrary.simpleMessage("Weekly"),
    "welcome" : m25,
    "year" : MessageLookupByLibrary.simpleMessage("Year"),
    "yearly_countrywide" : MessageLookupByLibrary.simpleMessage("Yearly countrywide"),
    "yearly_regional" : MessageLookupByLibrary.simpleMessage("Weekly"),
    "yes" : MessageLookupByLibrary.simpleMessage("Yes")
  };
}
