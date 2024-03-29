import 'package:flutter_test/flutter_test.dart';

import 'package:model/person.dart';
import 'package:model/facts.dart';
import 'package:uuid/uuid.dart';

void main() {
  var uuid = const Uuid();

  test('attended events are counted', () {
    final sut = Person();
    expect(sut.getEventsSummary().count, 0);
    sut.addFact(EventAttendance(id: uuid.v4(), date: DateTime.now(), duration: 0));
    expect(sut.getEventsSummary().count, 1);
    sut.addFact(EventAttendance(id: uuid.v4(), date: DateTime.now(), duration: 0));
    expect(sut.getEventsSummary().count, 2);
    // check if other facts are not included
    sut.addFact(TrainingAttendance(id: uuid.v4(), duration: 0));
    expect(sut.getEventsSummary().count, 2);
  });

  test('attended events time is added up', (){
    final sut = Person();
    expect(sut.getEventsSummary().duration, 0);
    sut.addFact(EventAttendance(id: uuid.v4(), date: DateTime.now(), duration: 45));
    expect(sut.getEventsSummary().duration, 45);
    sut.addFact(EventAttendance(id: uuid.v4(), date: DateTime.now(), duration: 30));
    expect(sut.getEventsSummary().duration, 75);
    // check if other facts are not included
    sut.addFact(TrainingAttendance(id: uuid.v4(), duration: 0));
    expect(sut.getEventsSummary().duration, 75);
  });

  test('event summary can be filtered by time', (){
    final sut = Person();
    sut.addFact(EventAttendance(id: uuid.v4(), date: DateTime.utc(2023, 1, 3), duration: 1));
    sut.addFact(EventAttendance(id: uuid.v4(), date: DateTime.utc(2023, 1, 4), duration: 3));
    sut.addFact(EventAttendance(id: uuid.v4(), date: DateTime.utc(2023, 1, 5), duration: 5));
    sut.addFact(EventAttendance(id: uuid.v4(), date: DateTime.utc(2023, 1, 7), duration: 11));

    // from is inclusive
    expect(sut.getEventsSummary(from: DateTime.utc(2023, 1, 4)).duration, 19);
    expect(sut.getEventsSummary(from: DateTime.utc(2023, 1, 6)).duration, 11);

    // to is exclusive
    expect(sut.getEventsSummary(to: DateTime.utc(2023, 1, 6)).duration, 9);
    expect(sut.getEventsSummary(to: DateTime.utc(2023, 1, 4)).duration, 1);

    // both from and to can work together
    expect(sut.getEventsSummary(from: DateTime.utc(2023, 1, 4), to: DateTime.utc(2023, 1, 5)).duration, 3);
  });
}
