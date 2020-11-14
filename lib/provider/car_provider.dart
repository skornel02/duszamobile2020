import 'dart:convert';

import 'package:duszamobile2020/resources/pojos/car.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

abstract class CarProvider {
  Future<List<Car>> loadCars();

  Future<void> saveCars(List<Car> cars);

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
}
