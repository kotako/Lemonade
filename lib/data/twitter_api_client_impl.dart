import 'dart:convert';
import 'dart:async';

import 'package:oauth1/oauth1.dart' as oauth1;

import 'twitter_api_client.dart';
import 'entity/session.dart';

class TwitterApiClientImpl extends oauth1.Client implements TwitterApiClient{
  final String baseUrl = 'api.twitter.com';
  final apiVersion = 1.1;
  Session currentSession;

  TwitterApiClientImpl(this.currentSession):
    super(oauth1.SignatureMethods.HMAC_SHA1,
          oauth1.ClientCredentials(currentSession.consumerKey, currentSession.consumerSecret),
          oauth1.Credentials(currentSession.accessToken, currentSession.accessSecret));

  @override
  Future<dynamic> getWithOAuth({String endpoint, Map params}) async {
    var url = _buildUrl(endpoint, params);
    var response = await get(url);

    return jsonDecode(response.body);
  }

  @override
  Future<dynamic> postWithOAuth({String endpoint, Map params, Map body}) async {
    var url = _buildUrl(endpoint, params);
    var response = await post(url, body: body);

    return jsonDecode(response.body);
  }

  String _buildUrl(String endpoint, [Map params]) {
    params = params?.map((k, v) => MapEntry(k.toString(), v.toString()))?.cast<String, String>();
    return Uri.https(baseUrl, '/$apiVersion' + endpoint, params).toString();
  }
}
