import 'package:flutter_test/flutter_test.dart';

import 'package:model/person.dart';
import 'package:model/facts.dart';
import 'package:uuid/uuid.dart';

void main() {
  test('events added to a person are idempotent', () {
    var uuid = const Uuid();
    final sut = Person();
    var event = EventAttendance(id: uuid.v4(), date: DateTime.now(), duration: 3);
    var training = TrainingAttendance(id: uuid.v4(), duration: 7);

    sut.addFact(event);
    sut.addFact(event);
    sut.addFact(training);
    sut.addFact(training);

    expect(sut.getEventsSummary().count, 1);
    expect(sut.getTrainingSummary().count, 1);
  });

  test('a person can be named and renamed', () {
    final sut = Person();
    expect(sut.getDetails().name, '');
    sut.addFact(PropertyChange(id: '', property: 'name', value: 'Adam'));
    expect(sut.getDetails().name, 'Adam');
    sut.addFact(PropertyChange(id: '', property: 'name', value: 'Beth'));
    expect(sut.getDetails().name, 'Beth');
  });
}