import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'reminder.g.dart';

@JsonSerializable()
class Reminder {
	String id;
  String name;
	String description; //Base64
	DateTime date;
	int milage;
	String recurringDate;
	int startMilageOffset;
	int everyMilage;

	Reminder(this.id, this.name, this.description, this.date, this.milage,
			this.recurringDate, this.startMilageOffset, this.everyMilage);

	String type(){

	}

	@override
	factory Reminder.fromJson(Map<String, dynamic> json) =>
			_$ReminderFromJson(json);

	@override
	Map<String, dynamic> toJson() => _$ReminderToJson(this);
}
