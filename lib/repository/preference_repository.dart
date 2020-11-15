import 'package:duszamobile2020/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> getSupportedLocale() {
  return ["en", "hu"];
}

Future<String> getCurrentLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print(
      "SYSTEM PREFFERED: ${Intl.getCurrentLocale()} USER PREFERRED: ${prefs.getString("preferredLang")}");
  String locale = prefs.getString("preferredLang") ?? Intl.getCurrentLocale();
  if (locale.startsWith("en")) locale = "en";
  return locale;
}

Future<void> setCurrentLocale(String locale) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("preferredLang", locale);
  S.load(Locale(locale));
}

Future<String> getStartingPage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // if (prefs.getString("firstOpen") == null) {
  //   prefs.setString("firstOpen", DateTime.now().toIso8601String());
  //   return "/intro";
  // }
  // final carId = prefs.getString("selectedCar");
  // if (carId != null) return "/cars/$carId";

  return "/cars";
}

Future<void> setSelectedCar(String id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("selectedCar", id);
  print("Setting selected car to: $id");
}

Future<void> clearSelectedCar() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("selectedCar");
  print("Clearing selected car");
}

Future<bool> getDarkMode() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool("darkMode") ?? false;
}

Future<void> setDarkMode(bool enabled) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("darkMode", enabled);
}
