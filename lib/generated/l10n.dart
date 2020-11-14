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