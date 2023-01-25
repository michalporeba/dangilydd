import 'package:flutter_test/flutter_test.dart';

import 'package:model/person.dart';

void main() {
  test('a newly created person has no events', () {
    final sut = Person();
    expect(sut.getEventsSummary().count, 0);
  });
}
