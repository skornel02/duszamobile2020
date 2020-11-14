import 'package:duszamobile2020/provider/car_provider.dart';
import 'package:duszamobile2020/resources/pojos/car.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test car parsing', () {
    CarProvider provider = FileCarProvider();
    test('Parse 0 cars', () {
      String noCar = '''
      []
      ''';
      List<Car> cars = provider.parseStringToCars(noCar);
      print(cars);
      expect(0, cars.length);
    });
  });
}
