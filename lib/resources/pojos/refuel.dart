import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'refuel.g.dart';

@JsonSerializable()
class Refuel {
	String id;
  double refueled;
	double paid;
	int lastMilage;
	int milage;

	Refuel(this.id, this.refueled, this.paid, this.lastMilage, this.milage);

	double pricePerLiter(){
     return paid/refueled;
	}

	double efficieny(){
		return milage-lastMilage/refueled;
	}

	@override
	factory Refuel.fromJson(Map<String, dynamic> json) =>
			_$RefuelFromJson(json);

	@override
	Map<String, dynamic> toJson() => _$RefuelToJson(this);
}
