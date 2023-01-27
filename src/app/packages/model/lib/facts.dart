library model;

abstract class Fact {
  const Fact();
}

class EventAttendance extends Fact {
  final DateTime date;
  final int duration;

  const EventAttendance({
    required this.date,
    required this.duration,
  });
}

class TrainingAttendance extends Fact {
  final int duration;

  const TrainingAttendance({required this.duration});
}

