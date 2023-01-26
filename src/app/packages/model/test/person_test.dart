import 'package:flutter_test/flutter_test.dart';

import 'package:model/person.dart';
import 'package:model/fact.dart';

void main() {
  test('a newly created person has no events', () {
    final sut = Person();
    expect(sut.getEventsSummary().count, 0);
  });

  test('an event attendance can be added', () {
    final sut = Person();
    sut.addFact(Fact());
    expect(sut.getEventsSummary().count, 1);
  });
}
