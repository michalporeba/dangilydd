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
    sut.addFact(EventAttendance());
    expect(sut.getEventsSummary().count, 1);
  });

  test('multiple event attendances can be added', () {
    final sut = Person();
    sut.addFact(EventAttendance());
    sut.addFact(EventAttendance());
    expect(sut.getEventsSummary().count, 2);
  });
}
