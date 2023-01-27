import 'package:flutter_test/flutter_test.dart';

import 'package:model/person.dart';
import 'package:model/facts.dart';

void main() {
  test('attended events are counted', () {
    final sut = Person();
    expect(sut.getEventsSummary().count, 0);
    sut.addFact(EventAttendance(date: DateTime.now(), duration: 0));
    expect(sut.getEventsSummary().count, 1);
    sut.addFact(EventAttendance(date: DateTime.now(), duration: 0));
    expect(sut.getEventsSummary().count, 2);
    // check if other facts are not included
    sut.addFact(const TrainingAttendance(duration: 0));
    expect(sut.getEventsSummary().count, 2);
  });

  test('attended events time is added up', (){
    final sut = Person();
    expect(sut.getEventsSummary().duration, 0);
    sut.addFact(EventAttendance(date: DateTime.now(), duration: 45));
    expect(sut.getEventsSummary().duration, 45);
    sut.addFact(EventAttendance(date: DateTime.now(), duration: 30));
    expect(sut.getEventsSummary().duration, 75);
    // check if other facts are not included
    sut.addFact(const TrainingAttendance(duration: 0));
    expect(sut.getEventsSummary().duration, 75);
  });

  test('event summary can be filtered by time', (){
    final sut = Person();
    sut.addFact(EventAttendance(date: DateTime.utc(2023, 1, 3), duration: 1));
    sut.addFact(EventAttendance(date: DateTime.utc(2023, 1, 4), duration: 3));
    sut.addFact(EventAttendance(date: DateTime.utc(2023, 1, 5), duration: 5));
    sut.addFact(EventAttendance(date: DateTime.utc(2023, 1, 6), duration: 11));
    expect(sut.getEventsSummary(from: DateTime.utc(2023,1, 4)).duration, 19);
  });
}
