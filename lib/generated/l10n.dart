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

  /// `Synchronise`
  String get synchronise {
    return Intl.message(
      'Synchronise',
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

  /// `Milometer`
  String get milometer {
    return Intl.message(
      'Milometer',
      name: 'milometer',
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

  /// `Liter price`
  String get liter_price {
    return Intl.message(
      'Liter price',
      name: 'liter_price',
      desc: '',
      args: [],
    );
  }

  /// `Consumption`
  String get consumption {
    return Intl.message(
      'Consumption',
      name: 'consumption',
      desc: '',
      args: [],
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

  /// `Car name`
  String get car_name {
    return Intl.message(
      'Car name',
      name: 'car_name',
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