import 'package:flutter_test/flutter_test.dart';

import 'package:model/person.dart';
import 'package:model/facts.dart';

void main() {
  test('attended training is counted', (){
    final sut = Person();
    expect(sut.getTrainingSummary().count, 0);
    sut.addFact(const TrainingAttendance(duration: 0));
    expect(sut.getTrainingSummary().count, 1);
    sut.addFact(const TrainingAttendance(duration: 0));
    expect(sut.getTrainingSummary().count, 2);
    // check if other facts are not included
    sut.addFact(EventAttendance(date: DateTime.now(), duration: 15));
    expect(sut.getTrainingSummary().count, 2);
  });

  test('attended training time is added up', () {
    final sut = Person();
    expect(sut.getTrainingSummary().duration, 0);
    sut.addFact(const TrainingAttendance(duration: 90));
    expect(sut.getTrainingSummary().duration, 90);
    sut.addFact(const TrainingAttendance(duration: 13));
    expect(sut.getTrainingSummary().duration, 103);
    // check if other facts are not included
    sut.addFact(EventAttendance(date: DateTime.now(), duration: 15));
    expect(sut.getTrainingSummary().duration, 103);
  });
}
