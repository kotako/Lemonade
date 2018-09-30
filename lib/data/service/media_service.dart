import 'dart:async';
import 'package:meta/meta.dart';

import 'package:lemonade/data/twitter_api_client.dart';
import 'package:lemonade/data/entity/media.dart';

abstract class MediaService {
  TwitterApiClient client;

  MediaService(this.client);

  Future<Media> upload({
    @required String mediaEncoded
  });
}