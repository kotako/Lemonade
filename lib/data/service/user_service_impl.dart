import 'dart:async';

import 'user_service.dart';
import '../twitter_api_client.dart';
import 'package:lemonade/data/entity/user.dart';

class UserServiceImpl extends UserService {
  TwitterApiClient client;

  int followersNextCursor;
  int friendsNextCursor;
  int blockingNextCursor;
  int mutingNextCursor;

  UserServiceImpl(this.client): super(client);

  @override
  Future<List<User>> followers({int userId, int cursor, int count, bool skipStatus, bool includeUserEntities}) async {
    var params = {
      'user_id': userId,
      'cursor': cursor,
      'count': count,
      'skip_status': skipStatus,
      'include_user_entities': includeUserEntities
    };
    var json = await client.getWithOAuth(endpoint: '/followers/list.json', params: params);
    followersNextCursor = json['next_cursor'];
    return (json['users'] as List).map((e) => User.fromJson(e)).toList();
  }

  @override
  Future<List<User>> friends({int userId, int cursor, int count, bool skipStatus, bool includeUserEntities}) async {
    var params = {
      'user_id': userId,
      'cursor': cursor,
      'count': count,
      'skip_status': skipStatus,
      'include_user_entities': includeUserEntities
    };
    var json = await client.getWithOAuth(endpoint: '/friends/list.json', params: params);
    friendsNextCursor = json['next_cursor'];
    return (json['users'] as List).map((e) => User.fromJson(e)).toList();
  }

  @override
  Future<List<User>> search({String q, int page, int count, bool includeEntities}) async {
    var params = {
      'q': q,
      'page': page,
      'count': count,
      'include_entities': includeEntities
    };
    var json = await client.getWithOAuth(endpoint: '/users/search.json', params: params);
    return (json as List).map((e) => User.fromJson(e)).toList();
  }

  @override
  Future<User> follow({int userId, bool enableNotification}) async {
    var params = {
      'user_id': userId,
      'follow': enableNotification
    };
    var json = await client.postWithOAuth(endpoint: '/friendships/create.json', params: params);
    return User.fromJson(json);
  }

  @override
  Future<User> unFollow({int userId}) async {
    var params = {
      'user_id': userId
    };
    var json = await client.postWithOAuth(endpoint: '/friendships/destroy.json', params: params);
    return User.fromJson(json);
  }

  @override
  Future<User> show({int userId, bool includeEntities}) async {
    var params = {
      'user_id': userId,
      'include_entities': includeEntities
    };
    var json = await client.getWithOAuth(endpoint: '/users/show.json', params: params);
    return User.fromJson(json);
  }

  @override
  Future<List<User>> blockingUsers({int cursor}) async {
    var params = {
      'cursor': cursor
    };
    var json = await client.getWithOAuth(endpoint: '/blocks/list.json', params: params);
    blockingNextCursor = json['cursor'];
    return (json['users'] as List).map((e) => User.fromJson(e)).toList();
  }

  @override
  Future<User> block({int userId, bool includeEntities, bool skipStatus}) async {
    var params = {
      'user_id': userId,
      'include_entities': includeEntities,
      'skip_status': skipStatus
    };
    var json = await client.postWithOAuth(endpoint: '/blocks/create.json', params: params);
    return User.fromJson(json);
  }

  @override
  Future<User> unBlock({int userId, bool includeEntities, bool skipStatus}) async {
    var params = {
      'user_id': userId,
      'include_entities': includeEntities,
      'skip_status': skipStatus
    };
    var json = await client.postWithOAuth(endpoint: '/blocks/destroy.json', params: params);
    return User.fromJson(json);
  }

  @override
  Future<List<User>> mutingUsers({int cursor}) async {
    var params = {
      'cursor': cursor
    };
    var json = await client.getWithOAuth(endpoint: '/mutes/users/list.json', params: params);
    mutingNextCursor = json['cursor'];
    return (json['users'] as List).map((e) => User.fromJson(e)).toList();
  }

  @override
  Future<User> mute({int userId}) async {
    var params = {
      'user_id': userId
    };
    var json = await client.postWithOAuth(endpoint: '/mutes/users/create.json', params: params);
    return User.fromJson(json);
  }

  @override
  Future<User> unMute({int userId}) async {
    var params = {
      'user_id': userId
    };
    var json = await client.postWithOAuth(endpoint: '/mutes/users/destroy.json', params: params);
    return User.fromJson(json);
  }

  @override
  Future<User> reportSpam({int userId, bool performWithBlock}) async {
    var params = {
      'user_id': userId,
      'perform_block': performWithBlock
    };
    var json = await client.postWithOAuth(endpoint: '/users/report_spam.json', params: params);
    return User.fromJson(json);
  }
}