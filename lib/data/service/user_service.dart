import 'dart:async';
import 'package:meta/meta.dart';

import 'package:lemonade/data/twitter_api_client.dart';
import 'package:lemonade/data/entity/user.dart';

abstract class UserService {
  TwitterApiClient client;

  UserService(this.client);

  Future<List<User>> followers({
    int userId,
    int cursor,
    int count,
    bool skipStatus,
    bool includeUserEntities
  });

  Future<List<User>> friends({
    int userId,
    int cursor,
    int count,
    bool skipStatus,
    bool includeUserEntities
  });

  Future<List<User>> search({
    @required String q,
    int page,
    int count,
    bool includeEntities
  });

  Future<User> follow({
    @required int userId,
    bool enableNotification
  });

  Future<User> unFollow({
    @required int userId
  });

  Future<User> show({
    @required int userId,
    bool includeEntities
  });

  Future<User> block({
    @required int userId,
    bool includeEntities,
    bool skipStatus
  });

  Future<User> unBlock({
    @required int userId,
    bool includeEntities,
    bool skipStatus
  });

  Future<User> mute({
    @required int userId
  });

  Future<User> unMute({
    @required int userId
  });

  Future<User> reportSpam({
    @required int userId,
    bool performWithBlock
  });

  Future<List<User>> mutingUsers({
    int cursor
  });

  Future<List<User>> blockingUsers({
    int cursor
  });
}
