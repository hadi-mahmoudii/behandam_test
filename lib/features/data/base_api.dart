import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class BaseApi {
  ///
  /// ---------- Authority ----------
  ///

  final _authority = 'debug.behaminplus.ir/behandam-diet/';
  final url = 'https://debug.behaminplus.ir/behandam-diet/';

  ///
  /// ---------- Methods ----------
  ///

  Future get({
    String? endpoint,
    Map<String, dynamic>? queries,
    Map<String, String>? headers,
    bool? isOffline,
  }) async =>
      httpRequest(
        method: 'kBaseApiGet',
        endpoint: 'api/profile',
        query: queries,
        header: headers,
        isOffline: isOffline,
      );

  ///
  /// ---------- Request ----------
  ///

  Future httpRequest({
    required String method,
    required String endpoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    dynamic stringBody,
    Map<String, String>? header,
    bool? isOffline,
    bool? isSavable,
  }) async {
    http.Client client = http.Client();
    http.Response? response;

    try {
      Uri.https(
        _authority,
        endpoint,
        query,
      );

      try {
        response = await client.get(Uri.parse(url), headers: header).timeout(const Duration(seconds: 30));
        return response;
      } on SocketException {
        if (isOffline == true && !Platform.isWindows) {}
      } on TimeoutException {
        if (isOffline == true && !Platform.isWindows) {}
      } catch (exception) {}
    } finally {
      client.close();
    }
  }
}
