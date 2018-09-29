import 'dart:async';
import 'package:meta/meta.dart';

import 'package:lemonade/data/twitter_api_client.dart';
import 'package:lemonade/data/entity/tweet.dart';

abstract class StatusService {
  TwitterApiClient client;

  StatusService(this.client);

  Future<List<Tweet>> homeTimeline({
    int count,
    int sinceId,
    int maxId,
    bool trimUser,
    bool excludeReplies,
    bool includeEntities});

  Future<List<Tweet>> mentionsTimeline({
    int count,
    int sinceId,
    int maxId,
    bool trimUser,
    bool includeEntities});

  Future<List<Tweet>> listTimeline({
    @required int listId,
    @required String slug,
    String ownerScreenName,
    int ownerId,
    int sinceId,
    int maxId,
    int count,
    bool includeEntities,
    bool includeRts});

  Future<List<Tweet>> search({
    @required String q,
    dynamic geoCode,
    String lang,
    String locale,
    String resultType,
    int count,
    String until,
    int sinceId,
    int maxId,
    bool includeEntities});

  Future<List<Tweet>> favorites({
    int userId,
    String screenName,
    int count,
    int sinceId,
    int maxId,
    bool includeEntities});

  Future<Tweet> show({
    @required int id,
    bool trimUser,
    bool includeMyRts,
    bool includeEntities,
    bool includeExtAltText,
    bool includeCardUri});

  Future<Tweet> update({
    @required String status,
    int inReplyToStatusId,
    bool autoPopulateReplyMetadata,
    String excludeReplyUserIds,
    String attachmentUrl,
    String mediaIds,
    bool possiblySensitive,
    double lat,
    double long,
    String placeId,
    bool displayCoordinates,
    bool trimUser,
    bool enableDmCommands,
    bool failDmCommands,
    String cardUri});

  Future<Tweet> destroy({
    @required int id,
    bool trimUser});

  Future<Tweet> retweet({
    @required int id,
    bool trimUser});

  Future<Tweet> unRetweet({
    @required int id,
    bool trimUser});

  Future<Tweet> favorite({
    @required int id,
    bool includeEntities});

  Future<Tweet> unFavorite({
    @required int id,
    bool includeEntities});
}
