import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'repair.g.dart';

@JsonSerializable()
class Repair {
	String id;
	String reason;



  DateTime date;
	int milage;
	double price;
	List<String> items;
	String description;

	Repair(this.id, this.reason, this.date, this.milage, this.price, this.items, this.description,);


	@override
	factory Repair.fromJson(Map<String, dynamic> json) =>
			_$RepairFromJson(json);

	@override
	Map<String, dynamic> toJson() => _$RepairToJson(this);
}
