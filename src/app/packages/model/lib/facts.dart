library model;

abstract class Fact {
  const Fact();
}

class EventAttendance extends Fact {
  final int duration;

  const EventAttendance({required this.duration});

  EventAttendance copyWith({int? duration})
  => EventAttendance(duration: duration ?? this.duration);
}

