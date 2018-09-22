import 'package:test/test.dart';
import 'dart:convert';

import 'package:lemonade/data/entity/media.dart';

main() {
  test('jsonからMediaを作成する', () {
    var json = jsonDecode(
        """{"type":"photo","sizes":{"thumb":{"h":150,"resize":"crop","w":150},
        "large":{"h":238,"resize":"fit","w":226},"medium":{"h":238,"resize":"fit","w":226},
        "small":{"h":238,"resize":"fit","w":226}},"indices":[15,35],"url":"http://t.co/rJC5Pxsu",
        "media_url":"http://p.twimg.com/AZVLmp-CIAAbkyy.jpg","display_url":"pic.twitter.com/rJC5Pxsu",
        "id":114080493040967680,"id_str":"114080493040967680","expanded_url":"http://twitter.com/yunorno/status/114080493036773378/photo/1",
        "media_url_https":"https://p.twimg.com/AZVLmp-CIAAbkyy.jpg"}""");
    var media = Media.fromJson(json);

    expect(media.runtimeType, equals(Media));
  });
}
