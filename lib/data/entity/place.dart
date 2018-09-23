class Place {
  final String id;
  final String url;
  final String placeType;
  final String name;
  final String fullName;
  final String countryCode;
  final String country;
  final dynamic boundingBox;
  final dynamic attributes;

  Place(
      this.id,
      this.url,
      this.placeType,
      this.name,
      this.fullName,
      this.countryCode,
      this.country,
      this.boundingBox,
      this.attributes);

  factory Place.fromJson(Map<String, dynamic> json) =>
      Place(
        json['id'] as String,
        json['url'] as String,
        json['place_type'] as String,
        json['name'] as String,
        json['full_name'] as String,
        json['country_code'] as String,
        json['country'] as String,
        json['bounding_box'],
        json['attributes']);
}