library model;

abstract class Fact {
  String id;
  Fact({required this.id});
}

class PropertyChange extends Fact {
  final String property;
  final String value;

  PropertyChange({
    required String id,
    required this.property,
    required this.value,
  }) : super(id: id);
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
  }) : super(id: id);
}

