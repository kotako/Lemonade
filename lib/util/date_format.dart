import 'package:intl/intl.dart';

DateTime parseTwitterDateFormat(String text) {
// twitter date format is not supported
// https://github.com/dart-lang/intl/issues/128
  text = text.substring(text.length - 4, text.length) + text;
  return DateFormat('yyyyEEE MMM dd HH:mm:ss Z').parse(text);
}
