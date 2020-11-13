import 'package:duszamobile2020/resources/pojos/refuel.dart';
import 'package:duszamobile2020/resources/pojos/reminder.dart';
import 'package:duszamobile2020/resources/pojos/repair.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'car.g.dart';

@JsonSerializable()
class Car {
	String id;
	String name;
	String image; //Base64
	List<Repair> repairs;
	List<Refuel> refuels;
	List<Reminder> reminds;
	double cost;
	int year;

	Car(this.id, this.name, this.image, this.repairs, this.refuels, this.reminds,
			this.cost, this.year);

	String totalMilage(){

	}

	double runningCost(){

	}

	double totalCost(){

	}


	@override
	factory Car.fromJson(Map<String, dynamic> json) =>
			_$CarFromJson(json);

	@override
	Map<String, dynamic> toJson() => _$CarToJson(this);
}
