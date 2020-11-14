import 'package:json_annotation/json_annotation.dart';

enum TireType {
  @JsonValue("NotSpecified")
  NOT_SPECIFIED,
  @JsonValue("Winter")
  WINTER,
  @JsonValue("Summer")
  SUMMER,
  @JsonValue("AllYear")
  ALL_YEAR,
}
