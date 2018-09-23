import 'package:lemonade/util/date_format.dart';

class Poll {
  final List<PollOption> options;
  final DateTime endDateTime;
  final int durationMinutes;

  Poll(this.options, this.endDateTime, this.durationMinutes);

  factory Poll.fromJson(Map<String, dynamic> json) {
    var options =
        (json['options'] as List).map((e) => PollOption.fromJson(e)).toList();
    var endDateTime = parseTwitterDateFormat(json['end_datetime']);

    return Poll(options, endDateTime, json['duration_minutes'] as int);
  }
}

class PollOption {
  final int position;
  final String text;

  PollOption(this.position, this.text);

  factory PollOption.fromJson(Map<String, dynamic> json) =>
      PollOption(json['position'] as int, json['text'] as String);
}
