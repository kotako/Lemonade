import 'package:test/test.dart';
import 'dart:convert';

import 'package:lemonade/data/entity/resource_url.dart';

main() {
  test('jsonからHashTagを作成する', () {
    var json = jsonDecode("""{"indices":[32,52],"url":"http://t.co/IOwBrTZR",
        "display_url":"youtube.com/watch?v=oHg5SJ…",
        "expanded_url":"http://www.youtube.com/watch?v=oHg5SJYRHA0"}""");
    var url = ResourceUrl.fromJson(json);

    expect(url.runtimeType, equals(ResourceUrl));
  });
}
