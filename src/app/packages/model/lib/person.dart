library model;

import 'package:model/events_summary.dart';
import 'package:model/facts.dart';
import 'package:model/person_details.dart';
import 'package:model/training_summary.dart';

class Person {
  final Map<String, Fact> _facts = <String, Fact>{};
  PersonDetails details = const PersonDetails(name: '');

  PersonDetails getDetails() {
    return details;
  }

  EventsSummary getEventsSummary({
    DateTime? from,
    DateTime? to,
  }) {
    var events = _facts.values.whereType<EventAttendance>();
    if (null != from) {
      events = events.where((e) => e.date.compareTo(from) >= 0);
    }
    if (null != to) {
      events = events.where((e) => e.date.compareTo(to) < 0);
    }
    return EventsSummary(
        count: events.length,
        duration: events.fold(0, (sum, e) => sum + e.duration)
    );
  }

  TrainingSummary getTrainingSummary()
  => TrainingSummary(
      count: _facts.values
          .whereType<TrainingAttendance>()
          .length,
      duration: _facts.values
          .whereType<TrainingAttendance>()
          .fold(0, (sum, current) => sum + current.duration)
  );

  void addFact(Fact fact) {
    if (fact is PropertyChange && fact.property == 'name') {
      details = PersonDetails(name: fact.value);
    }
    if (!_facts.containsKey(fact.id)) {
      _facts[fact.id] = fact;
    }
  }
}
