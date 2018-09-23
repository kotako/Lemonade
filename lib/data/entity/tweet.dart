import 'user.dart';
import 'entities.dart';
import 'place.dart';
import 'package:lemonade/util/date_format.dart';

class Tweet {
  final int id;
  final String text;
  final String source;
  final bool truncated;
  final int inReplyToStatusId;
  final int inReplyToUserId;
  final String inReplyToScreenName;
  final User user;
  final Place place;
  final int quotedStatusId;
  final bool isQuotedStatus;
  final Tweet quotedStatus;
  final Tweet retweetedStatus;
  final int quoteCount;
  final int replyCount;
  final int retweetCount;
  final int favoriteCount;
  final Entities entities;
  final Entities extendedEntities;
  final bool favorited;
  final bool retweeted;
  final DateTime createdAt;
  final bool possiblySensitive;
  final String filterLevel;
  final String lang;

  Tweet(
      this.id,
      this.text,
      this.source,
      this.truncated,
      this.inReplyToStatusId,
      this.inReplyToUserId,
      this.inReplyToScreenName,
      this.user,
      this.place,
      this.quotedStatusId,
      this.isQuotedStatus,
      this.quotedStatus,
      this.retweetedStatus,
      this.quoteCount,
      this.replyCount,
      this.retweetCount,
      this.favoriteCount,
      this.entities,
      this.extendedEntities,
      this.favorited,
      this.retweeted,
      this.createdAt,
      this.possiblySensitive,
      this.filterLevel,
      this.lang);

  factory Tweet.fromJson(Map<String, dynamic> json) {
    var user = json['user'] != null
        ? User.fromJson(json['user'])
        : null;

    var place = json['place'] != null
        ? Place.fromJson(json['place'])
        : null;

    var quotedStatus = json['quoted_status'] != null
        ? Tweet.fromJson(json['quoted_status'])
        : null;

    var retweetedStatus = json['retweeted_status'] != null
        ? Tweet.fromJson(json['retweeted_status'])
        : null;

    var entities = json['entities'] != null
        ? Entities.fromJson(json['entities'])
        : null;

    var extendedEntities = json['extended_entities'] != null
        ? Entities.fromJson(json['extended_entities'])
        : null;

    var createdAt = parseTwitterDateFormat(json['created_at']);

    return Tweet(
        json['id'] as int,
        json['text'] as String,
        json['source'] as String,
        json['truncated'] as bool,
        json['in_reply_to_status_id'] as int,
        json['in_reply_to_user_id'] as int,
        json['in_reply_to_screen_name'] as String,
        user,
        place,
        json['quoted_status_id'] as int,
        json['is_quote_status'] as bool,
        quotedStatus,
        retweetedStatus,
        json['quote_count'] as int,
        json['reply_count'] as int,
        json['retweet_count'] as int,
        json['favorite_count'] as int,
        entities,
        extendedEntities,
        json['favorited'] as bool,
        json['retweeted'] as bool,
        createdAt,
        json['possibly_sensitive'] as bool,
        json['filter_level'] as String,
        json['lang'] as String);
  }
}
