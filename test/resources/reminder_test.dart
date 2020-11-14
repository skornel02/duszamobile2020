import 'package:duszamobile2020/resources/pojos/reminder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';

void main() {
  group('test isDue', () {
    test('test due tomorrow', () {
      var now = DateTime.now();

      var tenDaysAgo = now.add(Duration(days: -10));

      Reminder elevenDaysReminder = Reminder.create(
          id: Uuid().v4(),
          name: "Eleven days",
          description: '',
          items: ["test"],
          date: tenDaysAgo,
          afterDays: 11,
          startMilage: 0,
          completed: false);

      print(elevenDaysReminder.isDue(now, 0));
      expect(elevenDaysReminder.isDue(now, 0), false);
    });

    test('test due today', () {
      var now = DateTime.now();

      var tenDaysAgo = now.add(Duration(days: -10));

      Reminder tenDaysReminder = Reminder.create(
          id: Uuid().v4(),
          name: "Ten days",
          description: '',
          items: ["test"],
          date: tenDaysAgo,
          afterDays: 10,
          startMilage: 0,
          completed: false);

      print(tenDaysReminder.isDue(now, 0));
      expect(tenDaysReminder.isDue(now, 0), true);
    });

    test('test due yesterday', () {
      var now = DateTime.now();

      var tenDaysAgo = now.add(Duration(days: -10));

      Reminder nineDaysReminder = Reminder.create(
          id: Uuid().v4(),
          name: "Nine days",
          description: '',
          items: ["test"],
          date: tenDaysAgo,
          afterDays: 9,
          startMilage: 0,
          completed: false);

      print(nineDaysReminder.isDue(now, 0));
      expect(nineDaysReminder.isDue(now, 0), true);
    });

    test('test due next 10 km', () {
      var now = DateTime.now();
      var milage = 10;

      Reminder twentyKmReminder = Reminder.create(
          id: Uuid().v4(),
          name: "Twenty km",
          description: '',
          items: ["test"],
          date: now,
          startMilage: 0,
          afterMilage: 20,
          completed: false);

      print(twentyKmReminder.isDue(now, milage));
      expect(twentyKmReminder.isDue(now, milage), false);
    });

    test('test due previous 10 km', () {
      var now = DateTime.now();
      var milage = 10;

      Reminder fiveKmReminder = Reminder.create(
          id: Uuid().v4(),
          name: "five km",
          description: '',
          items: ["test"],
          date: now,
          startMilage: 0,
          afterMilage: 5,
          completed: false);

      print(fiveKmReminder.isDue(now, milage));
      expect(fiveKmReminder.isDue(now, milage), true);
    });

    test('test neither date or milage is due', () {
      var now = DateTime.now();
      var milage = 10;

      var tenDaysAgo = now.add(Duration(days: -10));

      Reminder reminder = Reminder.create(
          id: Uuid().v4(),
          name: "Neither test",
          description: '',
          items: ["test"],
          date: tenDaysAgo,
          startMilage: 0,
          afterDays: 11,
          afterMilage: 20,
          completed: false);

      print(reminder.isDue(now, milage));
      expect(reminder.isDue(now, milage), false);
    });

    test('test date is due, mile is not', () {
      var now = DateTime.now();
      var milage = 10;

      var tenDaysAgo = now.add(Duration(days: -10));

      Reminder reminder = Reminder.create(
          id: Uuid().v4(),
          name: "date before test",
          description: '',
          items: ["test"],
          date: tenDaysAgo,
          startMilage: 0,
          afterDays: 9,
          afterMilage: 20,
          completed: false);

      print(reminder.isDue(now, milage));
      expect(reminder.isDue(now, milage), true);
    });

    test('test mile is due, date is not', () {
      var now = DateTime.now();
      var milage = 30;

      var tenDaysAgo = now.add(Duration(days: -10));

      Reminder reminder = Reminder.create(
          id: Uuid().v4(),
          name: "date before test",
          description: '',
          items: ["test"],
          date: tenDaysAgo,
          startMilage: 0,
          afterDays: 11,
          afterMilage: 20,
          completed: false);

      print(reminder.isDue(now, milage));
      expect(reminder.isDue(now, milage), true);
    });

    test('test date and milage is due', () {
      var now = DateTime.now();
      var milage = 30;

      var tenDaysAgo = now.add(Duration(days: -10));

      Reminder reminder = Reminder.create(
          id: Uuid().v4(),
          name: "date before test",
          description: '',
          items: ["test"],
          date: tenDaysAgo,
          startMilage: 0,
          afterDays: 9,
          afterMilage: 20,
          completed: false);

      print(reminder.isDue(now, milage));
      expect(reminder.isDue(now, milage), true);
    });

    test('test date and milage is due, but already complete', () {
      var now = DateTime.now();
      var milage = 30;

      var tenDaysAgo = now.add(Duration(days: -10));

      Reminder reminder = Reminder.create(
          id: Uuid().v4(),
          name: "date before test",
          description: '',
          items: ["test"],
          date: tenDaysAgo,
          startMilage: 0,
          afterDays: 9,
          afterMilage: 20,
          completed: true);

      print(reminder.isDue(now, milage));
      expect(reminder.isDue(now, milage), false);
    });
  });

  group('test suggestion', () {
    test('test date based suggestion', () {
      var now = DateTime.now();
      var milage = 20;

      var tenDaysAgo = now.add(Duration(days: -10));

      Reminder originalReminder = Reminder.create(
          id: Uuid().v4(),
          name: "Every 10 days",
          description: '',
          items: ["test"],
          date: tenDaysAgo,
          startMilage: 20,
          afterDays: 9,
          afterMilage: 20,
          completed: true);

      Reminder suggestedReminder = originalReminder.getSuggestion(now, milage);

      Reminder expectedReminder = Reminder.create(
          id: suggestedReminder.id,
          name: "Every 10 days",
          description: '',
          items: ["test"],
          date: now,
          startMilage: milage,
          afterDays: 9,
          afterMilage: 20,
          completed: false);

      print('suggested: ${suggestedReminder.toJson()}');
      print('expected: ${expectedReminder.toJson()}');

      expect(suggestedReminder, equals(expectedReminder));
    });
  });
}
