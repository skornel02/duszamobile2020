import 'dart:convert';

import 'package:duszamobile2020/provider/car_provider.dart';
import 'package:duszamobile2020/resources/pojos/car.dart';
import 'package:duszamobile2020/resources/pojos/car_settings.dart';
import 'package:duszamobile2020/resources/pojos/e_vignette.dart';
import 'package:duszamobile2020/resources/pojos/refuel.dart';
import 'package:duszamobile2020/resources/pojos/reminder.dart';
import 'package:duszamobile2020/resources/pojos/repair.dart';
import 'package:duszamobile2020/resources/pojos/tire_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';

void main() {
  group('Test car parsing', () {
    final car = Car.create(
        id: Uuid().v4(),
        name: 'Test car',
        eVignettes: List()
          ..add(EVignette.create(
              id: Uuid().v4(),
              start: DateTime.now(),
              duration: 2,
              area: "Magyarország")),
        refuels: List()
          ..add(Refuel.create(
              id: Uuid().v4(),
              date: DateTime.now(),
              refueled: 14,
              paid: 5740,
              lastMilage: 0,
              milage: 200)),
        reminds: List()
          ..add(Reminder.create(
              id: Uuid().v4(),
              name: "Kötelező",
              description: "Kötelező biztosítás évente",
              items: ["biztosítás"],
              date: DateTime.now(),
              afterDays: 365,
              startMilage: null,
              afterMilage: null,
              completed: false)),
        repairs: List()
          ..add(Repair.create(
              id: Uuid().v4(),
              date: DateTime.now(),
              milage: 200,
              price: 0,
              reason: "Időszakos",
              items: ["Motor olaj"],
              description: "Rendszeres olajcsere",
              warranty: true)),
        settings: CarSettings.create(image: "url", cost: 1000000, year: 2004),
        tire: TireType.WINTER);

    CarProvider provider = FileCarProvider();
    test('Parse 0 cars', () {
      String noCar = '''
      []
      ''';
      List<Car> cars = provider.parseStringToCars(noCar);
      print(cars);
      expect(0, cars.length);
    });

    test('Parse 1 car', () {
      String carsJson = json.encode(List<Car>()..add(car));
      print('Car json: $carsJson');
      List<Car> parsed = provider.parseStringToCars(carsJson);
      expect(parsed.length, 1);
      print('cars: $parsed');
      expect(parsed[0], equals(car));
    });

    test('Parse multiple cars (order)', () {
      int amount = 100;
      List<Car> toEncode = List<Car>();
      for (int i = 0; i < amount; i++) {
        toEncode.add(Car.from(car, id: Uuid().v4()));
      }
      String carsJson = json.encode(toEncode);
      print('Cars json: $carsJson');
      List<Car> parsed = provider.parseStringToCars(carsJson);
      expect(parsed.length, amount);
      for (int i = 0; i < amount; i++) {
        expect(parsed[i], equals(toEncode[i]));
      }
    });
  });
}
