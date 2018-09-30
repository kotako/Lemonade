import 'dart:convert';
import 'dart:async';

import 'package:oauth1/oauth1.dart' as oauth1;
import 'package:http/http.dart' as http;

import 'twitter_api_client.dart';
import 'entity/session.dart';
import 'entity/twitter_error.dart';

class TwitterApiClientImpl extends oauth1.Client implements TwitterApiClient{
  static const String apiBaseUrl = 'api.twitter.com';
  static const String uploadBaseUrl = 'upload.twitter.com';
  static const double apiVersion = 1.1;
  Session currentSession;

  TwitterApiClientImpl(this.currentSession):
    super(oauth1.SignatureMethods.HMAC_SHA1,
          oauth1.ClientCredentials(currentSession.consumerKey, currentSession.consumerSecret),
          oauth1.Credentials(currentSession.accessToken, currentSession.accessSecret));

  @override
  Future<dynamic> getWithOAuth({String endpoint, Map params}) async {
    params?.removeWhere((k, v) => v == null);
    
    var url = _buildUrl(endpoint, params: params);
    var response = await get(url);
    var json = jsonDecode(response.body);

    if (response.statusCode >= 400) {
      var errors = (json as Map<String, dynamic>)['errors'] as List;
      throw TwitterError.fromJson(errors.first);
    }
    return json;
  }

  @override
  Future<dynamic> postWithOAuth({String endpoint, Map params, Map body}) async {
    params?.removeWhere((k, v) => v == null);
    body?.removeWhere((k, v) => v == null);
    
    var url = _buildUrl(endpoint, params: params);
    var response = await post(url, body: body);
    var json = jsonDecode(response.body);

    if (response.statusCode >= 400) {
      var errors = (json as Map<String, dynamic>)['errors'] as List;
      throw TwitterError.fromJson(errors.first);
    }
    return json;
  }

  @override
  Future<dynamic> postMultipartWithOAuth({String endpoint, Map params, Map files}) async {
    params?.removeWhere((k, v) => v == null);
    files?.removeWhere((k, v) => v == null);
    
    var url = _buildUrl(endpoint, baseUrl: uploadBaseUrl, params: params);
    var request = http.MultipartRequest('POST', Uri.parse(url));
    files?.forEach((k, v) => request.files.add(http.MultipartFile.fromString(k, v)));

    var response = await http.Response.fromStream(await send(request));
    var json = jsonDecode(response.body);

    if (response.statusCode >= 400) {
      var errors = (json as Map<String, dynamic>)['errors'] as List;
      throw TwitterError.fromJson(errors.first);
    }
    return json;
  }

  String _buildUrl(String endpoint, {String baseUrl = apiBaseUrl, Map params}) {
    params = params?.map((k, v) => MapEntry(k.toString(), v.toString()))?.cast<String, String>();
    return Uri.https(baseUrl, '/$apiVersion' + endpoint, params).toString();
  }
}
