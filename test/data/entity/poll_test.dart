import 'package:test/test.dart';
import 'dart:convert';

import 'package:lemonade/data/entity/poll.dart';

main() {
  test('jsonからpollOptionを作成する', () {
    var json = jsonDecode(
        """{ "position": 1, "text": "I read documentation once." }""");
    var pollOption = PollOption.fromJson(json);

    expect(pollOption.runtimeType, equals(PollOption));
  });

  test('jsonからPollを作成する', () {
    var json = jsonDecode("""{
        "options": [
          {
            "position": 1,
            "text": "I read documentation once."
          },
          {
            "position": 2,
            "text": "I read documentation twice."
          },
          {
            "position": 3,
            "text": "I read documentation over and over again."
          }
        ],
        "end_datetime": "Thu May 25 22:20:27 +0000 2017",
        "duration_minutes": 60
      }""");
    var poll = Poll.fromJson(json);

    expect(poll.runtimeType, equals(Poll));
  });
}
