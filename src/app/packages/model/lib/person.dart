library model;

import 'package:model/events_summary.dart';
import 'package:model/facts.dart';

class Person {
  final List<Fact> _facts = <Fact>[];

  EventsSummary getEventsSummary() {
    return EventsSummary(count: _facts.length);
  }

  void addFact(Fact fact) {
    _facts.add(fact);
  }
}
