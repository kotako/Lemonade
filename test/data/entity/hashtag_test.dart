import 'package:test/test.dart';
import 'dart:convert';

import 'package:lemonade/data/entity/hashtag.dart';

main() {
  test('jsonからHashTagを作成する', () {
    var json = jsonDecode("""{"indices": [32, 38], "text": "nodejs"}""");
    var hashTag = HashTag.fromJson(json);

    expect(hashTag.runtimeType, equals(HashTag));
  });
}
