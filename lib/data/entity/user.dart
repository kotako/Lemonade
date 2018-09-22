import 'package:lemonade/util/date_format.dart';

class User {
  final int id;
  final String name;
  final String screenName;
  final String location;
  final String url;
  final String description;
  final bool protected;
  final bool verified;
  final dynamic derived;
  final int followersCount;
  final int friendsCount;
  final int listedCount;
  final int favoritesCount;
  final int statusesCount;
  final DateTime createdAt;
  final bool geoEnabled;
  final String lang;
  final bool contributorsEnabled;
  final String profileBackgroundColor;
  final String profileBackgroundImageUrl;
  final bool profileBackgroundTile;
  final String profileBannerUrl;
  final String profileImageUrl;
  final bool profileUseBackgroundImage;
  final bool defaultProfile;
  final bool defaultProfileImage;
  final List<String> withheldInCountries;
  final String withheldScope;

  User(
      this.id,
      this.name,
      this.screenName,
      this.location,
      this.url,
      this.description,
      this.protected,
      this.verified,
      this.derived,
      this.followersCount,
      this.friendsCount,
      this.listedCount,
      this.favoritesCount,
      this.statusesCount,
      this.createdAt,
      this.geoEnabled,
      this.lang,
      this.contributorsEnabled,
      this.profileBackgroundColor,
      this.profileBackgroundImageUrl,
      this.profileBackgroundTile,
      this.profileBannerUrl,
      this.profileImageUrl,
      this.profileUseBackgroundImage,
      this.defaultProfile,
      this.defaultProfileImage,
      this.withheldInCountries,
      this.withheldScope);

  factory User.fromJson(Map<String, dynamic> json) {
    var createdAt = parseTwitterDateFormat(json['created_at']);

    return User(
        json['id'] as int,
        json['name'] as String,
        json['screen_name'] as String,
        json['location'] as String,
        json['url'] as String,
        json['description'] as String,
        json['protected'] as bool,
        json['verified'] as bool,
        json['derived'],
        json['followers_count'] as int,
        json['friends_count'] as int,
        json['listed_count'] as int,
        json['favorites_count'] as int,
        json['statuses_count'] as int,
        createdAt,
        json['geo_enabled'] as bool,
        json['lang'] as String,
        json['contributors_enabled'] as bool,
        json['profile_background_color'] as String,
        json['profile_background_image_url'] as String,
        json['profile_background_tile'] as bool,
        json['profile_banner_url'] as String,
        json['profile_image_url'] as String,
        json['profile_use_background_image'] as bool,
        json['default_profile'] as bool,
        json['default_profile_image'] as bool,
        json['withheld_in_countries'] as List<String>,
        json['withheld_scope'] as String);
  }
}
