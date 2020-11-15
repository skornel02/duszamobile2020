import 'package:duszamobile2020/repository/car_repository.dart';
import 'package:duszamobile2020/resources/reminder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
	Workmanager.executeTask((task, inputData) {
		print("Native called background task: $task"); //simpleTask will be emitted here.

		CarRepository carRepository = new CarRepository();

		 carRepository.getCars().then((carList) => carList.forEach((car) {
			 car.getNotifications.forEach((reminder) {
				 NotificationService.showNotificationWithReminder(reminder);
			 });
		 }));

		return Future.value(true);
	});
}

class NotificationService{

	static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
	FlutterLocalNotificationsPlugin();

	static Future<void> init() async {
		// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
		const AndroidInitializationSettings initializationSettingsAndroid =
		AndroidInitializationSettings('@mipmap/ic_launcher');
		final IOSInitializationSettings initializationSettingsIOS =
		IOSInitializationSettings(
				onDidReceiveLocalNotification: onDidReceiveLocalNotification);
		final MacOSInitializationSettings initializationSettingsMacOS =
		MacOSInitializationSettings();
		final InitializationSettings initializationSettings = InitializationSettings(
				android: initializationSettingsAndroid,
				iOS: initializationSettingsIOS,
				macOS: initializationSettingsMacOS);
		await flutterLocalNotificationsPlugin.initialize(initializationSettings,
				onSelectNotification: onSelectNotification);

		Workmanager.initialize(
				callbackDispatcher, // The top level function, aka callbackDispatcher
				isInDebugMode: true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
		);
		Workmanager.registerPeriodicTask("uniqueName", "taskName",
				frequency: Duration(days: 1),
				existingWorkPolicy: ExistingWorkPolicy.replace,
				initialDelay: Duration(days: 0)
		);
	}

	static Future<void> showNotificationWithReminders() async {
		CarRepository carRepository = new CarRepository();
		(await carRepository.getCars()).forEach((car) {
			car.getNotifications.forEach((reminder) {
				NotificationService.showNotificationWithReminder(reminder);
			});
		});
	}


	static Future<void> showNotificationWithReminder(Reminder reminder) async {
		const AndroidNotificationDetails androidPlatformChannelSpecifics =
		AndroidNotificationDetails(
				'reminderNotification', 'Reminder notification channel', "Notification channel for the car's reminders",
				importance: Importance.max,
				priority: Priority.high,
				showWhen: false);
		const NotificationDetails platformChannelSpecifics =
		NotificationDetails(android: androidPlatformChannelSpecifics);

		await flutterLocalNotificationsPlugin.show(
				0, reminder.name, reminder.notificationText(DateTime.now(), 0), platformChannelSpecifics,
				payload: 'item x');
	}

	static Future<void> showNotification() async {
		const AndroidNotificationDetails androidPlatformChannelSpecifics =
		AndroidNotificationDetails(
				'your channel id', 'your channel name', 'your channel description',
				importance: Importance.max,
				priority: Priority.high,
				showWhen: false);
		const NotificationDetails platformChannelSpecifics =
		NotificationDetails(android: androidPlatformChannelSpecifics);


		await flutterLocalNotificationsPlugin.show(
				0, "test", "seees", platformChannelSpecifics,
				payload: 'item x');
	}



	static Future onSelectNotification(String payload) async {
		if (payload != null) {
			debugPrint('notification payload: $payload');
		}
		/*
		await Navigator.push(
			context,
			MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
		);
		*/
	}



	static Future onDidReceiveLocalNotification(
			int id, String title, String body, String payload) async {
		// display a dialog with the notification details, tap ok to go to another page

		/*showDialog(
			context: context,
			builder: (BuildContext context)=>
					CupertinoAlertDialog(
						title: Text(title),
						content: Text(body),
						actions: [
							CupertinoDialogAction(
								isDefaultAction: true,
								child: Text('Ok'),
								onPressed: ()async {
									Navigator.of(context, rootNavigator: true).pop();
									await Navigator.push(
										context,
										MaterialPageRoute(
											builder: (context)=> SecondScreen(payload),
										),
									);
								},
							)
						],
					),
		);
		*/
	}


	static checkNotifications(){

	}


}

