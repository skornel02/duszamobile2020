import 'package:duszamobile2020/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> getSupportedLocale() {
  return ["en", "hu"];
}

Future<String> getCurrentLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print("PREFFERED: ${prefs.getString("preferredLang")}");
  print("CURRENT: ${Intl.getCurrentLocale()}");
  String locale = prefs.getString("preferredLang") ?? Intl.getCurrentLocale();
  if (locale.startsWith("en")) locale = "en";
  return locale;
}

Future<void> setCurrentLocale(String locale) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("preferredLang", locale);
  S.load(Locale(locale));
}
