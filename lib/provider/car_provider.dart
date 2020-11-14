import 'dart:convert';

import 'package:duszamobile2020/resources/pojos/car.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CarProvider {
  Future<List<Car>> loadCars();

  Future<void> saveCars(List<Car> cars);

  Future<DateTime> lastModified();

  @visibleForTesting
  List<Car> parseStringToCars(String str) {
    List<dynamic> jsonData = json.decode(str);
    List<Car> cars = List<Car>();
    for (var item in jsonData) {
      try {
        cars.add(Car.fromJson(item));
      } catch (ex) {
        printError('Failed to parse car reason: $ex');
      }
    }
    return cars;
  }
}

class FileCarProvider extends CarProvider {
  @override
  Future<List<Car>> loadCars() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/cars.json');
    if (!(await file.exists())) await saveCars([]);
    String fileData = await file.readAsString();
    return this.parseStringToCars(fileData);
  }

  @override
  Future<void> saveCars(List<Car> cars) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/cars.json');

    String data = json.encode(cars);
    await file.writeAsString(data);
  }

  @override
  Future<DateTime> lastModified() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/cars.json');
    try {
      return file.lastModified();
    } catch (err) {
      printError("Couldn't load last modification date: $err");
      return DateTime.parse("1999-01-01T00:00:01Z");
    }
  }
}

class WebCarProvider extends CarProvider {
  @override
  Future<List<Car>> loadCars() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString("Cars") ?? "";
    if (data.isEmpty) data = "[]";
    return this.parseStringToCars(data);
  }

  @override
  Future<void> saveCars(List<Car> cars) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Cars", json.encode(cars));
    prefs.setString("LastModified", json.encode(DateTime.now()));
  }

  @override
  Future<DateTime> lastModified() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String lastModified = prefs.getString("LastModified");
      return json.decode(lastModified);
    } catch (err) {
      printError("Couldn't load last modification date: $err");
      return DateTime.parse("1999-01-01T00:00:01Z");
    }
  }
}
