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

  static m10(day) => "${day} days left";

  static m11(car_name) => "remove car \'${car_name}\'";

  static m12(date) => "remove E-Vignette valid from ${date}";

  static m13(date) => "remove refuel log at ${date}";

  static m14(title) => "remove reminder with title \'${title}\'";

  static m15(date) => "remove repair log at ${date}";

  static m16(do_something) => "You do want to ${do_something}?";

  static m17(area) => "[E-Vignette] ${area} will expire";

  static m18(s) => "No ${s} added yet";

  static m19(date) => "Valid until ${date}";

  static m20(km) => "${km} km left";

  static m21(area, time) => "Last ${area} change: ${time}";

  static m22(price) => "Liter price: ${price} \$";

  static m23(date, title) => "Your reminder set for ${date} has expired! ${title}";

  static m24(title) => "Check your reminder: ${title}";

  static m25(milage, title) => "Your milage goal ${milage} is over! ${title}";

  static m26(carName) => "Refuels - ${carName}";

  static m27(item, amount) => "${item}: ${amount} \$";

  static m28(name) => "Welcome ${name}!";

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
    "days_left" : m10,
    "description" : MessageLookupByLibrary.simpleMessage("Description"),
    "do_remove_car" : m11,
    "do_remove_e_vignette" : m12,
    "do_remove_refuel" : m13,
    "do_remove_reminder" : m14,
    "do_remove_repair" : m15,
    "do_you_want_to" : m16,
    "e_vignette_expiration_reminder" : m17,
    "e_vignette_page_menuitem" : MessageLookupByLibrary.simpleMessage("E-Vignettes"),
    "edit" : MessageLookupByLibrary.simpleMessage("Edit"),
    "edit_car" : MessageLookupByLibrary.simpleMessage("Edit car"),
    "edit_refuel" : MessageLookupByLibrary.simpleMessage("Edit refuel"),
    "edit_reminder" : MessageLookupByLibrary.simpleMessage("Edit reminder"),
    "edit_repair" : MessageLookupByLibrary.simpleMessage("Edit repair"),
    "empty" : m18,
    "evignettes" : MessageLookupByLibrary.simpleMessage("EVignettes"),
    "expiration" : MessageLookupByLibrary.simpleMessage("Expiration"),
    "expiration_date" : m19,
    "expiration_monthly" : MessageLookupByLibrary.simpleMessage("Monthly"),
    "expiration_weekly" : MessageLookupByLibrary.simpleMessage("Weekly"),
    "expiration_yearly" : MessageLookupByLibrary.simpleMessage("Annual"),
    "expired" : MessageLookupByLibrary.simpleMessage("Expired"),
    "export" : MessageLookupByLibrary.simpleMessage("Export"),
    "export_json" : MessageLookupByLibrary.simpleMessage("My JSON export"),
    "filter" : MessageLookupByLibrary.simpleMessage("Filter"),
    "general_statistics" : MessageLookupByLibrary.simpleMessage("General statistics"),
    "google_login" : MessageLookupByLibrary.simpleMessage("Google login"),
    "km_left" : m20,
    "language" : MessageLookupByLibrary.simpleMessage("Language"),
    "last_change" : m21,
    "last_milage" : MessageLookupByLibrary.simpleMessage("Last refuel milage"),
    "last_refuel_was_recorded" : MessageLookupByLibrary.simpleMessage("Last refuel was recorded"),
    "liter_price" : m22,
    "local_area" : MessageLookupByLibrary.simpleMessage("local"),
    "main_page" : MessageLookupByLibrary.simpleMessage("Main page"),
    "milage" : MessageLookupByLibrary.simpleMessage("Current milage"),
    "monthly" : MessageLookupByLibrary.simpleMessage("Monthly"),
    "more_regions" : MessageLookupByLibrary.simpleMessage("More regions"),
    "my_cars" : MessageLookupByLibrary.simpleMessage("My cars"),
    "name" : MessageLookupByLibrary.simpleMessage("Name"),
    "no" : MessageLookupByLibrary.simpleMessage("No"),
    "notification_date" : m23,
    "notification_date_and_milage" : m24,
    "notification_milage" : m25,
    "notify_after_kilometers" : MessageLookupByLibrary.simpleMessage("Notify after kilometers"),
    "notify_on_date" : MessageLookupByLibrary.simpleMessage("Notify on date"),
    "only_annual_for_county" : MessageLookupByLibrary.simpleMessage("Only country wide available"),
    "other_regions" : MessageLookupByLibrary.simpleMessage("Other regions"),
    "petrol_price_over_time" : MessageLookupByLibrary.simpleMessage("Petrol price change"),
    "price" : MessageLookupByLibrary.simpleMessage("Price"),
    "reason" : MessageLookupByLibrary.simpleMessage("Reason"),
    "refuel" : MessageLookupByLibrary.simpleMessage("refuel"),
    "refuels" : MessageLookupByLibrary.simpleMessage("Refuels"),
    "refuels_page_menuitem" : MessageLookupByLibrary.simpleMessage("Refuels"),
    "refuels_page_title" : m26,
    "region" : MessageLookupByLibrary.simpleMessage("Region"),
    "regional" : MessageLookupByLibrary.simpleMessage("Regional"),
    "remind_about_e_vignette" : MessageLookupByLibrary.simpleMessage("Do you want to create a reminder when the E-Vignette expires?"),
    "reminders" : MessageLookupByLibrary.simpleMessage("Reminders"),
    "reminders_page_menuitem" : MessageLookupByLibrary.simpleMessage("Reminders"),
    "remote_area" : MessageLookupByLibrary.simpleMessage("remote"),
    "repair" : MessageLookupByLibrary.simpleMessage("repair"),
    "repairs" : MessageLookupByLibrary.simpleMessage("Repairs"),
    "repairs_page_menuitem" : MessageLookupByLibrary.simpleMessage("Repairs"),
    "repeat_this_reminder_again" : MessageLookupByLibrary.simpleMessage("Do you want to repeat this reminder?"),
    "save" : MessageLookupByLibrary.simpleMessage("Save"),
    "settings_description" : MessageLookupByLibrary.simpleMessage("Everything from syncing to the cloud to dark mode can be accessed here. Mash some buttons and see what happens!"),
    "spending_format" : m27,
    "statistics" : MessageLookupByLibrary.simpleMessage("Statistics"),
    "statistics_page_menuitem" : MessageLookupByLibrary.simpleMessage("Statistics"),
    "suggestion" : MessageLookupByLibrary.simpleMessage("Suggestion"),
    "synchronise" : MessageLookupByLibrary.simpleMessage("Synchronize"),
    "test_notification" : MessageLookupByLibrary.simpleMessage("Test notification"),
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
    "welcome" : m28,
    "year" : MessageLookupByLibrary.simpleMessage("Year"),
    "yearly_countrywide" : MessageLookupByLibrary.simpleMessage("Yearly countrywide"),
    "yearly_regional" : MessageLookupByLibrary.simpleMessage("Yearly regional"),
    "yes" : MessageLookupByLibrary.simpleMessage("Yes")
  };
}
