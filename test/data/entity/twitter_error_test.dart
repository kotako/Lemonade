import 'package:test/test.dart';
import 'dart:convert';

import 'package:lemonade/data/entity/twitter_error.dart';

main() {
  test('jsonからtwittererrorを作成する', () {
    var json = jsonDecode("""{"code": 215, "message": "Bad Authentication data."}""");
    var twitterError = TwitterError.fromJson(json);

    expect(twitterError.runtimeType, equals(TwitterError));
  });
}
