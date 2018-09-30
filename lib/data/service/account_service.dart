import 'dart:async';
import 'package:meta/meta.dart';

import 'package:lemonade/data/twitter_api_client.dart';
import 'package:lemonade/data/entity/user.dart';

abstract class AccountService {
  TwitterApiClient client;

  AccountService(this.client);

  Future<User> current();

  Future<User> update({
    String name,
    String url,
    String location,
    String description,
    String profileLinkColor,
    bool includeEntities,
    bool skipStatus
  });

  Future<User> updateBanner({
    @required String bannerEncoded,
    int width,
    int height,
    int offsetLeft,
    int offsetTop
  });

  Future<User> updateImage({
    @required String imageEncoded,
    bool includeEntities,
    bool skipStatus
  });
}