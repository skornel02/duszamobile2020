// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Dusza mobile 2020`
  String get title {
    return Intl.message(
      'Dusza mobile 2020',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Cheese`
  String get cheese {
    return Intl.message(
      'Cheese',
      name: 'cheese',
      desc: '',
      args: [],
    );
  }

  /// `Main page`
  String get main_page {
    return Intl.message(
      'Main page',
      name: 'main_page',
      desc: '',
      args: [],
    );
  }

  /// `Welcome {name}!`
  String welcome(Object name) {
    return Intl.message(
      'Welcome $name!',
      name: 'welcome',
      desc: '',
      args: [name],
    );
  }

  /// `Car editor`
  String get car_editor {
    return Intl.message(
      'Car editor',
      name: 'car_editor',
      desc: '',
      args: [],
    );
  }

  /// `Export`
  String get export {
    return Intl.message(
      'Export',
      name: 'export',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `User settings`
  String get user_settings {
    return Intl.message(
      'User settings',
      name: 'user_settings',
      desc: '',
      args: [],
    );
  }

  /// `Google login`
  String get google_login {
    return Intl.message(
      'Google login',
      name: 'google_login',
      desc: '',
      args: [],
    );
  }

  /// `Synchronize`
  String get synchronise {
    return Intl.message(
      'Synchronize',
      name: 'synchronise',
      desc: '',
      args: [],
    );
  }

  /// `Calendar synchronisation`
  String get calendar_synchronisation {
    return Intl.message(
      'Calendar synchronisation',
      name: 'calendar_synchronisation',
      desc: '',
      args: [],
    );
  }

  /// `Dark theme`
  String get dark_theme {
    return Intl.message(
      'Dark theme',
      name: 'dark_theme',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Last refuel was recorded`
  String get last_refuel_was_recorded {
    return Intl.message(
      'Last refuel was recorded',
      name: 'last_refuel_was_recorded',
      desc: '',
      args: [],
    );
  }

  /// `Liter price: {price} $`
  String liter_price(Object price) {
    return Intl.message(
      'Liter price: $price \$',
      name: 'liter_price',
      desc: '',
      args: [price],
    );
  }

  /// `Efficiency: {efficiency} l/100km`
  String consumption(Object efficiency) {
    return Intl.message(
      'Efficiency: $efficiency l/100km',
      name: 'consumption',
      desc: '',
      args: [efficiency],
    );
  }

  /// `{item}: {amount} $`
  String spending_format(Object item, Object amount) {
    return Intl.message(
      '$item: $amount \$',
      name: 'spending_format',
      desc: '',
      args: [item, amount],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Regional`
  String get regional {
    return Intl.message(
      'Regional',
      name: 'regional',
      desc: '',
      args: [],
    );
  }

  /// `Region`
  String get region {
    return Intl.message(
      'Region',
      name: 'region',
      desc: '',
      args: [],
    );
  }

  /// `Weekly`
  String get weekly {
    return Intl.message(
      'Weekly',
      name: 'weekly',
      desc: '',
      args: [],
    );
  }

  /// `Monthly`
  String get monthly {
    return Intl.message(
      'Monthly',
      name: 'monthly',
      desc: '',
      args: [],
    );
  }

  /// `Yearly countrywide`
  String get yearly_countrywide {
    return Intl.message(
      'Yearly countrywide',
      name: 'yearly_countrywide',
      desc: '',
      args: [],
    );
  }

  /// `Weekly`
  String get yearly_regional {
    return Intl.message(
      'Weekly',
      name: 'yearly_regional',
      desc: '',
      args: [],
    );
  }

  /// `Other regions`
  String get other_regions {
    return Intl.message(
      'Other regions',
      name: 'other_regions',
      desc: '',
      args: [],
    );
  }

  /// `More regions`
  String get more_regions {
    return Intl.message(
      'More regions',
      name: 'more_regions',
      desc: '',
      args: [],
    );
  }

  /// `Bought`
  String get bought {
    return Intl.message(
      'Bought',
      name: 'bought',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get year {
    return Intl.message(
      'Year',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `Edit car`
  String get edit_car {
    return Intl.message(
      'Edit car',
      name: 'edit_car',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Tyre type`
  String get tire_type {
    return Intl.message(
      'Tyre type',
      name: 'tire_type',
      desc: '',
      args: [],
    );
  }

  /// `Winter`
  String get tire_type_winter {
    return Intl.message(
      'Winter',
      name: 'tire_type_winter',
      desc: '',
      args: [],
    );
  }

  /// `Summer`
  String get tire_type_summer {
    return Intl.message(
      'Summer',
      name: 'tire_type_summer',
      desc: '',
      args: [],
    );
  }

  /// `All year`
  String get tire_type_all_year {
    return Intl.message(
      'All year',
      name: 'tire_type_all_year',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get tire_type_other {
    return Intl.message(
      'Other',
      name: 'tire_type_other',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get statistics {
    return Intl.message(
      'Statistics',
      name: 'statistics',
      desc: '',
      args: [],
    );
  }

  /// `Refuels`
  String get refuels {
    return Intl.message(
      'Refuels',
      name: 'refuels',
      desc: '',
      args: [],
    );
  }

  /// `Reminders`
  String get reminders {
    return Intl.message(
      'Reminders',
      name: 'reminders',
      desc: '',
      args: [],
    );
  }

  /// `EVignettes`
  String get evignettes {
    return Intl.message(
      'EVignettes',
      name: 'evignettes',
      desc: '',
      args: [],
    );
  }

  /// `Repairs`
  String get repairs {
    return Intl.message(
      'Repairs',
      name: 'repairs',
      desc: '',
      args: [],
    );
  }

  /// `Change car`
  String get change_car {
    return Intl.message(
      'Change car',
      name: 'change_car',
      desc: '',
      args: [],
    );
  }

  /// `Add refuel`
  String get add_refuel {
    return Intl.message(
      'Add refuel',
      name: 'add_refuel',
      desc: '',
      args: [],
    );
  }

  /// `Add reminder`
  String get add_reminder {
    return Intl.message(
      'Add reminder',
      name: 'add_reminder',
      desc: '',
      args: [],
    );
  }

  /// `Add eVignette`
  String get add_evignette {
    return Intl.message(
      'Add eVignette',
      name: 'add_evignette',
      desc: '',
      args: [],
    );
  }

  /// `Add repair`
  String get add_repair {
    return Intl.message(
      'Add repair',
      name: 'add_repair',
      desc: '',
      args: [],
    );
  }

  /// `Edit reminder`
  String get edit_reminder {
    return Intl.message(
      'Edit reminder',
      name: 'edit_reminder',
      desc: '',
      args: [],
    );
  }

  /// `Edit refuel`
  String get edit_refuel {
    return Intl.message(
      'Edit refuel',
      name: 'edit_refuel',
      desc: '',
      args: [],
    );
  }

  /// `Edit repair`
  String get edit_repair {
    return Intl.message(
      'Edit repair',
      name: 'edit_repair',
      desc: '',
      args: [],
    );
  }

  /// `My cars`
  String get my_cars {
    return Intl.message(
      'My cars',
      name: 'my_cars',
      desc: '',
      args: [],
    );
  }

  /// `Add car`
  String get add_car {
    return Intl.message(
      'Add car',
      name: 'add_car',
      desc: '',
      args: [],
    );
  }

  /// `Car settings`
  String get car_settings {
    return Intl.message(
      'Car settings',
      name: 'car_settings',
      desc: '',
      args: [],
    );
  }

  /// `Car name`
  String get car_name {
    return Intl.message(
      'Car name',
      name: 'car_name',
      desc: '',
      args: [],
    );
  }

  /// `Current milage`
  String get milage {
    return Intl.message(
      'Current milage',
      name: 'milage',
      desc: '',
      args: [],
    );
  }

  /// `Last refuel milage`
  String get last_milage {
    return Intl.message(
      'Last refuel milage',
      name: 'last_milage',
      desc: '',
      args: [],
    );
  }

  /// `After milage`
  String get after_milage {
    return Intl.message(
      'After milage',
      name: 'after_milage',
      desc: '',
      args: [],
    );
  }

  /// `{item} can't be empty!`
  String cant_be_empty(Object item) {
    return Intl.message(
      '$item can\'t be empty!',
      name: 'cant_be_empty',
      desc: '',
      args: [item],
    );
  }

  /// `{item} can't be over {amount} of characters`
  String cant_be_over(Object item, Object amount) {
    return Intl.message(
      '$item can\'t be over $amount of characters',
      name: 'cant_be_over',
      desc: '',
      args: [item, amount],
    );
  }

  /// `{item} must be a valid integer`
  String cant_be_not_int(Object item) {
    return Intl.message(
      '$item must be a valid integer',
      name: 'cant_be_not_int',
      desc: '',
      args: [item],
    );
  }

  /// `{item} must be a valid number`
  String cant_be_not_double(Object item) {
    return Intl.message(
      '$item must be a valid number',
      name: 'cant_be_not_double',
      desc: '',
      args: [item],
    );
  }

  /// `{item} must have a valid date`
  String cant_be_invalid_date(Object item) {
    return Intl.message(
      '$item must have a valid date',
      name: 'cant_be_invalid_date',
      desc: '',
      args: [item],
    );
  }

  /// `{item} must be bigger than {otherItem}`
  String cant_be_smaller(Object item, Object otherItem) {
    return Intl.message(
      '$item must be bigger than $otherItem',
      name: 'cant_be_smaller',
      desc: '',
      args: [item, otherItem],
    );
  }

  /// `{targetDate} must be after {date}`
  String cant_be_before(Object targetDate, Object date) {
    return Intl.message(
      '$targetDate must be after $date',
      name: 'cant_be_before',
      desc: '',
      args: [targetDate, date],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `yyyy-MM-dd – kk:mm`
  String get time_format {
    return Intl.message(
      'yyyy-MM-dd – kk:mm',
      name: 'time_format',
      desc: '',
      args: [],
    );
  }

  /// `Last {area} change: {time}`
  String last_change(Object area, Object time) {
    return Intl.message(
      'Last $area change: $time',
      name: 'last_change',
      desc: '',
      args: [area, time],
    );
  }

  /// `local`
  String get local_area {
    return Intl.message(
      'local',
      name: 'local_area',
      desc: '',
      args: [],
    );
  }

  /// `remote`
  String get remote_area {
    return Intl.message(
      'remote',
      name: 'remote_area',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get are_you_sure {
    return Intl.message(
      'Are you sure?',
      name: 'are_you_sure',
      desc: '',
      args: [],
    );
  }

  /// `You dou want to {do_something}?`
  String do_you_want_to(Object do_something) {
    return Intl.message(
      'You dou want to $do_something?',
      name: 'do_you_want_to',
      desc: '',
      args: [do_something],
    );
  }

  /// `remove car '{car_name}'`
  String do_remove_car(Object car_name) {
    return Intl.message(
      'remove car \'$car_name\'',
      name: 'do_remove_car',
      desc: '',
      args: [car_name],
    );
  }

  /// `remove repair log at {date}`
  String do_remove_repair(Object date) {
    return Intl.message(
      'remove repair log at $date',
      name: 'do_remove_repair',
      desc: '',
      args: [date],
    );
  }

  /// `remove refuel log at {date}`
  String do_remove_refuel(Object date) {
    return Intl.message(
      'remove refuel log at $date',
      name: 'do_remove_refuel',
      desc: '',
      args: [date],
    );
  }

  /// `remove reminder with title '{title}'`
  String do_remove_reminder(Object title) {
    return Intl.message(
      'remove reminder with title \'$title\'',
      name: 'do_remove_reminder',
      desc: '',
      args: [title],
    );
  }

  /// `remove E-Vignette valid from {date}`
  String do_remove_e_vignette(Object date) {
    return Intl.message(
      'remove E-Vignette valid from $date',
      name: 'do_remove_e_vignette',
      desc: '',
      args: [date],
    );
  }

  /// `dd-MM-yyyy`
  String get date_format {
    return Intl.message(
      'dd-MM-yyyy',
      name: 'date_format',
      desc: '',
      args: [],
    );
  }

  /// `yyyy.MM.dd`
  String get date_format_to_show {
    return Intl.message(
      'yyyy.MM.dd',
      name: 'date_format_to_show',
      desc: '',
      args: [],
    );
  }

  /// `Your reminder set for {date} has expired! {title}`
  String notification_date(Object date, Object title) {
    return Intl.message(
      'Your reminder set for $date has expired! $title',
      name: 'notification_date',
      desc: '',
      args: [date, title],
    );
  }

  /// `Your milage goal {milage} is over! {title}`
  String notification_milage(Object milage, Object title) {
    return Intl.message(
      'Your milage goal $milage is over! $title',
      name: 'notification_milage',
      desc: '',
      args: [milage, title],
    );
  }

  /// `Check your reminder: {title}`
  String notification_date_and_milage(Object title) {
    return Intl.message(
      'Check your reminder: $title',
      name: 'notification_date_and_milage',
      desc: '',
      args: [title],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Notify on date`
  String get notify_on_date {
    return Intl.message(
      'Notify on date',
      name: 'notify_on_date',
      desc: '',
      args: [],
    );
  }

  /// `Notify after kilometers`
  String get notify_after_kilometers {
    return Intl.message(
      'Notify after kilometers',
      name: 'notify_after_kilometers',
      desc: '',
      args: [],
    );
  }

  /// `Reason`
  String get reason {
    return Intl.message(
      'Reason',
      name: 'reason',
      desc: '',
      args: [],
    );
  }

  /// `Under warranty`
  String get warranty {
    return Intl.message(
      'Under warranty',
      name: 'warranty',
      desc: '',
      args: [],
    );
  }

  /// `Refuels - {carName}`
  String refuels_page_title(Object carName) {
    return Intl.message(
      'Refuels - $carName',
      name: 'refuels_page_title',
      desc: '',
      args: [carName],
    );
  }

  /// `Refuels`
  String get refuels_page_menuitem {
    return Intl.message(
      'Refuels',
      name: 'refuels_page_menuitem',
      desc: '',
      args: [],
    );
  }

  /// `Consumption in liter/100km`
  String get consumption_label {
    return Intl.message(
      'Consumption in liter/100km',
      name: 'consumption_label',
      desc: '',
      args: [],
    );
  }

  /// `Repairs`
  String get repairs_page_menuitem {
    return Intl.message(
      'Repairs',
      name: 'repairs_page_menuitem',
      desc: '',
      args: [],
    );
  }

  /// `Reminders`
  String get reminders_page_menuitem {
    return Intl.message(
      'Reminders',
      name: 'reminders_page_menuitem',
      desc: '',
      args: [],
    );
  }

  /// `E-Vignettes`
  String get e_vignette_page_menuitem {
    return Intl.message(
      'E-Vignettes',
      name: 'e_vignette_page_menuitem',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get statistics_page_menuitem {
    return Intl.message(
      'Statistics',
      name: 'statistics_page_menuitem',
      desc: '',
      args: [],
    );
  }

  /// `Car settings`
  String get car_settings_page_menuitem {
    return Intl.message(
      'Car settings',
      name: 'car_settings_page_menuitem',
      desc: '',
      args: [],
    );
  }

  /// `User/App settings`
  String get user_settings_page_menuitem {
    return Intl.message(
      'User/App settings',
      name: 'user_settings_page_menuitem',
      desc: '',
      args: [],
    );
  }

  /// `Choose different car`
  String get back_to_cars_menuitem {
    return Intl.message(
      'Choose different car',
      name: 'back_to_cars_menuitem',
      desc: '',
      args: [],
    );
  }

  /// `{efficiency} $`
  String currency(Object efficiency) {
    return Intl.message(
      '$efficiency \$',
      name: 'currency',
      desc: '',
      args: [efficiency],
    );
  }

  /// `Valid until {date}`
  String expiration_date(Object date) {
    return Intl.message(
      'Valid until $date',
      name: 'expiration_date',
      desc: '',
      args: [date],
    );
  }

  /// `Expiration`
  String get expiration {
    return Intl.message(
      'Expiration',
      name: 'expiration',
      desc: '',
      args: [],
    );
  }

  /// `Weekly`
  String get expiration_weekly {
    return Intl.message(
      'Weekly',
      name: 'expiration_weekly',
      desc: '',
      args: [],
    );
  }

  /// `Monthly`
  String get expiration_monthly {
    return Intl.message(
      'Monthly',
      name: 'expiration_monthly',
      desc: '',
      args: [],
    );
  }

  /// `Annual`
  String get expiration_yearly {
    return Intl.message(
      'Annual',
      name: 'expiration_yearly',
      desc: '',
      args: [],
    );
  }

  /// `Only country wide available`
  String get only_annual_for_county {
    return Intl.message(
      'Only country wide available',
      name: 'only_annual_for_county',
      desc: '',
      args: [],
    );
  }

  /// `County`
  String get county {
    return Intl.message(
      'County',
      name: 'county',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message(
      'Active',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Expired`
  String get expired {
    return Intl.message(
      'Expired',
      name: 'expired',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get upcoming {
    return Intl.message(
      'Upcoming',
      name: 'upcoming',
      desc: '',
      args: [],
    );
  }

  /// `Suggestion`
  String get suggestion {
    return Intl.message(
      'Suggestion',
      name: 'suggestion',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to create a reminder when the E-Vignette expires?`
  String get remind_about_e_vignette {
    return Intl.message(
      'Do you want to create a reminder when the E-Vignette expires?',
      name: 'remind_about_e_vignette',
      desc: '',
      args: [],
    );
  }

  /// `[E-Vignette] {area} will expire`
  String e_vignette_expiration_reminder(Object area) {
    return Intl.message(
      '[E-Vignette] $area will expire',
      name: 'e_vignette_expiration_reminder',
      desc: '',
      args: [area],
    );
  }

  /// `Automatically generated`
  String get automatically_generated {
    return Intl.message(
      'Automatically generated',
      name: 'automatically_generated',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to complete '{name}'?`
  String complete_reminder(Object name) {
    return Intl.message(
      'Are you sure you want to complete \'$name\'?',
      name: 'complete_reminder',
      desc: '',
      args: [name],
    );
  }

  /// `Do you want to repeat this reminder?`
  String get repeat_this_reminder_again {
    return Intl.message(
      'Do you want to repeat this reminder?',
      name: 'repeat_this_reminder_again',
      desc: '',
      args: [],
    );
  }

  /// `Both`
  String get both {
    return Intl.message(
      'Both',
      name: 'both',
      desc: '',
      args: [],
    );
  }

  /// `Refuel`
  String get refuel {
    return Intl.message(
      'Refuel',
      name: 'refuel',
      desc: '',
      args: [],
    );
  }

  /// `Everything from syncing to the cloud to dark mode can be accessed here. Mash some buttons and see what happens!`
  String get settings_description {
    return Intl.message(
      'Everything from syncing to the cloud to dark mode can be accessed here. Mash some buttons and see what happens!',
      name: 'settings_description',
      desc: '',
      args: [],
    );
  }

  /// `No {s} added yet`
  String empty(Object s) {
    return Intl.message(
      'No $s added yet',
      name: 'empty',
      desc: '',
      args: [s],
    );
  }

  /// `Total spending`
  String get total_spending {
    return Intl.message(
      'Total spending',
      name: 'total_spending',
      desc: '',
      args: [],
    );
  }

  /// `Petrol price change`
  String get petrol_price_over_time {
    return Intl.message(
      'Petrol price change',
      name: 'petrol_price_over_time',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `General statistics`
  String get general_statistics {
    return Intl.message(
      'General statistics',
      name: 'general_statistics',
      desc: '',
      args: [],
    );
  }

  /// `Test notification`
  String get test_notification {
    return Intl.message(
      'Test notification',
      name: 'test_notification',
      desc: '',
      args: [],
    );
  }

  /// `My JSON export`
  String get export_json {
    return Intl.message(
      'My JSON export',
      name: 'export_json',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'hu'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}