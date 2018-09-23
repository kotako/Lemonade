import 'package:test/test.dart';
import 'dart:convert';

import 'package:lemonade/data/entity/symbol.dart';

main() {
  test('jsonからSymbolを作成する', () {
    var json = jsonDecode("{\"indices\":[32,36],\"text\":\"TWTR\"}");
    var symbol = Symbol.fromJson(json);

    expect(symbol.runtimeType, equals(Symbol));
  });
}
