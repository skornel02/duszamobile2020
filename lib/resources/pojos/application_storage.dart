import 'package:duszamobile2020/resources/pojos/refuel.dart';
import 'package:duszamobile2020/resources/pojos/reminder.dart';
import 'package:duszamobile2020/resources/pojos/repair.dart';
import 'package:json_annotation/json_annotation.dart';

import 'car.dart';

part 'application_storage.g.dart';

@JsonSerializable()
class ApplicationStorage {
	List<Car> cars;
	String selectedCar;
  String lang;
	bool darkMode;
	String accountStatus;

	ApplicationStorage(
			this.cars, this.selectedCar, this.lang, this.darkMode, this.accountStatus);

	@override
	factory ApplicationStorage.fromJson(Map<String, dynamic> json) =>
			_$ApplicationStorageFromJson(json);

	@override
	Map<String, dynamic> toJson() => _$ApplicationStorageToJson(this);
}
