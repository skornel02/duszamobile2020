import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'e_vignette.g.dart';

@JsonSerializable()
@immutable
class EVignette extends Equatable {
  final String id;
  final DateTime start;
  final int duration;
  final String area;

  EVignette.create(
      {@required this.id,
      @required this.start,
      @required this.duration,
      @required this.area});

  EVignette(this.id, this.start, this.duration, this.area);

  /// Static copy constructor with overriding.
  factory EVignette.from(
    EVignette eVignette, {
    String id,
    DateTime start,
    int duration,
    String area,
  }) {
    return EVignette.create(
        id: id ?? eVignette.id,
        start: start ?? eVignette.start,
        duration: duration ?? eVignette.duration,
        area: area ?? eVignette.area);
  }

  bool isActive(DateTime date) {
    var dueDateTime = this.start.add(Duration(days: duration));
    var dateDate = DateTime.utc(date.year, date.month, date.day);
    var dueDate =
        DateTime.utc(dueDateTime.year, dueDateTime.month, dueDateTime.day);
    return dateDate.isAtSameMomentAs(dueDate) || dueDate.isAfter(dateDate);
  }

  @override
  factory EVignette.fromJson(Map<String, dynamic> json) =>
      _$EVignetteFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EVignetteToJson(this);

  @override
  List<Object> get props => [id, start, duration, area];
}
