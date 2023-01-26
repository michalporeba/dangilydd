library model;

import 'package:model/events_summary.dart';
import 'package:model/facts.dart';
import 'package:model/training_summary.dart';

class Person {
  final List<Fact> _facts = <Fact>[];

  EventsSummary getEventsSummary()
    => EventsSummary(
        count: _facts
            .whereType<EventAttendance>()
            .length,
        duration: _facts
            .whereType<EventAttendance>()
            .map((e) => e.duration)
            .fold(0, (sum, current) => sum+current)
    );

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
