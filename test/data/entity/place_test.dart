import 'package:test/test.dart';
import 'dart:convert';

import 'package:lemonade/data/entity/place.dart';

main() {
  test('jsonからplaceを作成する', () {
    var json = jsonDecode(
        """
        {
    "id": "07d9db48bc083000",
    "url": "https://api.twitter.com/1.1/geo/id/07d9db48bc083000.json",
    "place_type": "poi",
    "name": "McIntosh Lake",
    "full_name": "McIntosh Lake",
    "country_code": "US",
    "country": "United States",
    "bounding_box": {
      "type": "Polygon",
      "coordinates": [
        [
          [
            -105.14544,
            40.192138
          ],
          [
            -105.14544,
            40.192138
          ],
          [
            -105.14544,
            40.192138
          ],
          [
            -105.14544,
            40.192138
          ]
        ]
      ]
    },
    "attributes": {
      
    }
  }
        """);
    var place = Place.fromJson(json);

    expect(place.runtimeType, equals(Place));
  });
}
