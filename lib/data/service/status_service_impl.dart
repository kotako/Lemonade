import 'dart:async';

import 'status_service.dart';
import 'package:lemonade/data/twitter_api_client.dart';
import 'package:lemonade/data/entity/tweet.dart';


class StatusServiceImpl extends StatusService {
  TwitterApiClient client;

  StatusServiceImpl(this.client): super(client);

  @override
  Future<List<Tweet>> homeTimeline({int count, int sinceId, int maxId, bool trimUser, bool excludeReplies, bool includeEntities}) async {
    var params = {
      'count': count,
      'since_id': sinceId,
      'max_id': maxId,
      'trim_user': trimUser,
      'exclude_replies': excludeReplies,
      'include_entities': includeEntities
    };
    var json = await client.getWithOAuth(endpoint: '/statuses/home_timeline.json', params: params);
    return (json as List).map((e) => Tweet.fromJson(e)).toList();
  }

  @override
  Future<List<Tweet>> mentionsTimeline({int count, int sinceId, int maxId, bool trimUser, bool includeEntities}) async {
    var params = {
      'count': count,
      'since_id': sinceId,
      'max_id': maxId,
      'trim_user': trimUser,
      'include_entities': includeEntities
    };
    var json = await client.getWithOAuth(endpoint: '/statuses/mentions_timeline.json', params: params);
    return (json as List).map((e) => Tweet.fromJson(e)).toList();
  }

  @override
  Future<List<Tweet>> listTimeline({int listId, String slug, String ownerScreenName, int ownerId, int sinceId, int maxId, int count, bool includeEntities, bool includeRts}) async {
    var params = {
      'list_id': listId,
      'slug': slug,
      'owner_screen_name': ownerScreenName,
      'owner_id': ownerId,
      'since_id': sinceId,
      'max_id': maxId,
      'count': count,
      'include_entities': includeEntities,
      'include_rts': includeRts
    };
    var json = await client.getWithOAuth(endpoint: '/lists/statuses.json', params: params);
    return (json as List).map((e) => Tweet.fromJson(e)).toList();
  }

  @override
  Future<List<Tweet>> search({String q, geoCode, String lang, String locale, String resultType, int count, String until, int sinceId, int maxId, bool includeEntities}) async {
    var params = {
      'q': q,
      'geocode': geoCode,
      'lang': lang,
      'local': locale,
      'result_type': resultType,
      'count': count,
      'until': until,
      'since_id': sinceId,
      'max_id': maxId,
      'include_entities': includeEntities
    };
    var json = await client.getWithOAuth(endpoint: '/search/tweets.json', params: params);
    return (json['statuses'] as List).map((e) => Tweet.fromJson(e)).toList();
  }

  @override
  Future<List<Tweet>> favorites({int userId, String screenName, int count, int sinceId, int maxId, bool includeEntities}) async {
    var params = {
      'user_id': userId,
      'screen_name': screenName,
      'count': count,
      'since_id': sinceId,
      'max_id': maxId,
      'include_entities': includeEntities
    };
    var json = await client.getWithOAuth(endpoint: '/favorites/list.json', params: params);
    return (json as List).map((e) => Tweet.fromJson(e)).toList();
  }

  @override
  Future<Tweet> show({int id, bool trimUser, bool includeMyRts, bool includeEntities, bool includeExtAltText, bool includeCardUri}) async {
    var params = {
      'id': id,
      'trim_user': trimUser,
      'include_my_retweet': includeMyRts,
      'include_entities': includeEntities,
      'include_ext_alt_text': includeExtAltText,
      'include_card_uri': includeCardUri
    };
    var json = await client.getWithOAuth(endpoint: '/statuses/show.json', params: params);
    return Tweet.fromJson(json);
  }

  @override
  Future<Tweet> update({String status, int inReplyToStatusId, bool autoPopulateReplyMetadata, String excludeReplyUserIds, String attachmentUrl, String mediaIds, bool possiblySensitive, double lat, double long, String placeId, bool displayCoordinates, bool trimUser, bool enableDmCommands, bool failDmCommands, String cardUri}) async {
    var params = {
      'status': status,
      'in_reply_to_status_id': inReplyToStatusId,
      'auto_populate_reply_metadata': autoPopulateReplyMetadata,
      'exclude_reply_user_ids': excludeReplyUserIds,
      'attachment_url': attachmentUrl,
      'media_ids': mediaIds,
      'possibly_sensitive': possiblySensitive,
      'lat': lat,
      'long': long,
      'place_id': placeId,
      'display_coordinates': displayCoordinates,
      'trim_user': trimUser,
      'enable_dm_commands': enableDmCommands,
      'fail_dm_commands': failDmCommands,
      'card_uri': cardUri
    };
    var json = await client.postWithOAuth(endpoint: '/statuses/update.json', params: params);
    return Tweet.fromJson(json);
  }

  @override
  Future<Tweet> destroy({int id, bool trimUser}) async {
    var params = {
      'trim_user': trimUser
    };
    var json = await client.postWithOAuth(endpoint: '/statuses/destroy/$id.json', params: params);
    return Tweet.fromJson(json);
  }

  @override
  Future<Tweet> retweet({int id, bool trimUser}) async {
    var params = {
      'trim_user': trimUser
    };
    var json = await client.postWithOAuth(endpoint: '/statuses/retweet/$id.json', params: params);
    return Tweet.fromJson(json);
  }

  @override
  Future<Tweet> unRetweet({int id, bool trimUser}) async {
    var params = {
      'trim_user': trimUser
    };
    var json = await client.postWithOAuth(endpoint: '/statuses/unretweet/$id.json', params: params);
    return Tweet.fromJson(json);
  }

  @override
  Future<Tweet> favorite({int id, bool includeEntities}) async {
    var params = {
      'id': id,
      'include_entities': includeEntities
    };
    var json = await client.postWithOAuth(endpoint: '/favorites/create.json', params: params);
    return Tweet.fromJson(json);
  }

  @override
  Future<Tweet> unFavorite({int id, bool includeEntities}) async {
    var params = {
      'id': id,
      'include_entities': includeEntities
    };
    var json = await client.postWithOAuth(endpoint: '/favorites/create.json', params: params);
    return Tweet.fromJson(json);
  }
}
