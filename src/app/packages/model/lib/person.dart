library model;

import 'package:model/events_summary.dart';
import 'package:model/facts.dart';
import 'package:model/training_summary.dart';

class Person {
  final List<Fact> _facts = <Fact>[];

  EventsSummary getEventsSummary({DateTime? from}) {
    var events = _facts.whereType<EventAttendance>();
    if (null != from) {
      events = events.where((e) => e.date.compareTo(from) >= 0);
    }
    return EventsSummary(
        count: events.length,
        duration: events.fold(0, (sum, e) => sum + e.duration)
    );
  }

  TrainingSummary getTrainingSummary()
  => TrainingSummary(
      count: _facts
          .whereType<TrainingAttendance>()
          .length,
      duration: _facts
          .whereType<TrainingAttendance>()
          .fold(0, (sum, current) => sum + current.duration)
  );

  void addFact(Fact fact) {
    _facts.add(fact);
  }
}
