import 'package:flutter_test/flutter_test.dart';

import 'package:model/person.dart';
import 'package:model/facts.dart';

void main() {
  test('a newly created person has no events', () {
    final sut = Person();
    expect(sut.getEventsSummary().count, 0);
  });

  test('an event attendance can be added', () {
    final sut = Person();
    sut.addFact(const EventAttendance(duration: 0));
    expect(sut.getEventsSummary().count, 1);
  });

  test('multiple event attendances can be added', () {
    final sut = Person();
    sut.addFact(const EventAttendance(duration: 0));
    sut.addFact(const EventAttendance(duration: 0));
    expect(sut.getEventsSummary().count, 2);
  });

  test('events time is added up', (){
    final sut = Person();
    sut.addFact(const EventAttendance(duration: 45));
    expect(sut.getEventsSummary().duration, 45);
  });
}
