import 'package:test/test.dart';
import 'dart:convert';

import 'package:lemonade/data/entity/session.dart';
import 'package:lemonade/data/twitter_api_client.dart';
import 'package:lemonade/data/twitter_api_client_impl.dart';
import 'package:lemonade/data/service/media_service.dart';
import 'package:lemonade/data/service/media_service_impl.dart';

import '../../test_config.dart';

main() {
  TwitterApiClient client;
  MediaService service;

  setUp(() {
    client = TwitterApiClientImpl(Session(credential['consumerKey'], credential['consumerSecret'], credential['accessToken'], credential['accessSecret']));
    service = MediaServiceImpl(client);
  });

  test('#upload', () async {
    var media = mockImage;
    var mediaEncoded = base64Encode(media.readAsBytesSync());
    var response = await service.upload(mediaEncoded: mediaEncoded);
    expect(response, isNotNull);
  });
}
