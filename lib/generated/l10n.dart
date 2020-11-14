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