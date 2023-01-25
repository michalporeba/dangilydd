import 'package:flutter_test/flutter_test.dart';

import 'package:model/person.dart';

void main() {
  test('adds one to input values', () {
    final sut = Person();
    expect(sut.addOne(2), 3);
    expect(sut.addOne(-7), -6);
    expect(sut.addOne(0), 1);
  });
}
