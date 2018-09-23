import 'package:test/test.dart';
import 'dart:convert';

import 'package:lemonade/data/entity/entities.dart';

main() {
  test('jsonからEntitiesを作成する', () {
    var json = jsonDecode(
        """{"url":{"urls":[{"url":"https:\/\/t.co\/csVcQdyEoK","expanded_url":"https:\/\/profmy.com\/2\/","display_url":"profmy.com\/2\/","indices":[0,23]}]}}""");
    var entities = Entities.fromJson(json);

    expect(entities.runtimeType, equals(Entities));
  });
}
