import 'package:flutter_test/flutter_test.dart';

import 'package:model/person.dart';
import 'package:model/facts.dart';

void main() {
  test('attended events are counted', () {
    final sut = Person();
    expect(sut.getEventsSummary().count, 0);
    sut.addFact(const EventAttendance(duration: 0));
    expect(sut.getEventsSummary().count, 1);
    sut.addFact(const EventAttendance(duration: 0));
    expect(sut.getEventsSummary().count, 2);
    // check if other facts are not included
    sut.addFact(const TrainingAttendance(duration: 0));
    expect(sut.getEventsSummary().count, 2);
  });

  test('attended events time is added up', (){
    final sut = Person();
    expect(sut.getEventsSummary().duration, 0);
    sut.addFact(const EventAttendance(duration: 45));
    expect(sut.getEventsSummary().duration, 45);
    sut.addFact(const EventAttendance(duration: 30));
    expect(sut.getEventsSummary().duration, 75);
    // check if other facts are not included
    sut.addFact(const TrainingAttendance(duration: 0));
    expect(sut.getEventsSummary().duration, 75);
  });
}
