import 'package:test/test.dart';

import 'package:lemonade/util/date_format.dart';

main() {
  test('Twitterでの日付が正しくパースできる', () {
    var date = 'Wed Jun 06 20:07:10 +0000 2012';
    var parsedDate = parseTwitterDateFormat(date);
    var expectedDate = DateTime(2012, 6, 6, 20, 7, 10);

    expect(expectedDate, equals(parsedDate));
  });
}
