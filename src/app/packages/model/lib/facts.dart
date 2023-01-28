library model;

import 'package:uuid/uuid.dart';

abstract class Fact {
  String id;
  Fact({required this.id});
}

class EventAttendance extends Fact {
  final DateTime date;
  final int duration;

  EventAttendance({
    required String id,
    required this.date,
    required this.duration,
  }) : super(id: id);
}

class TrainingAttendance extends Fact {
  final int duration;

  TrainingAttendance({
    required String id,
    required this.duration,
  })
      : super(id: id);
}

