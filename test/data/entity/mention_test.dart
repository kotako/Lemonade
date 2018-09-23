import 'package:test/test.dart';
import 'dart:convert';

import 'package:lemonade/data/entity/mention.dart';

main() {
  test('jsonからMentionを作成する', () {
    var json = jsonDecode(
        """{\"name\":\"Twitter API\", \"indices\":[4,15], \"screen_name\":\"twitterapi\",
           \"id\":6253282, \"id_str\":\"6253282\"}""");
    var mention = Mention.fromJson(json);

    expect(mention.runtimeType, equals(Mention));
  });
}
