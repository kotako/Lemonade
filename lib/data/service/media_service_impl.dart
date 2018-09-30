import 'dart:async';

import 'media_service.dart';
import 'package:lemonade/data/twitter_api_client.dart';
import 'package:lemonade/data/entity/media.dart';

class MediaServiceImpl extends MediaService {
  TwitterApiClient client;

  MediaServiceImpl(this.client): super(client);

  @override
  Future<Media> upload({String mediaEncoded}) async {
    var body = {
      'media_data': mediaEncoded
    };
    var json = await client.postMultipartWithOAuth(baseUrl: TwitterApiClient.uploadBaseUrl, endpoint: '/media/upload.json', files: body);
    return Media.fromJson(json);
  }
}