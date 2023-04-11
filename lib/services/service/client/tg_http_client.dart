import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class TGHttpClient extends http.BaseClient {
  static bool badCertificateCallbackEnabled = false;

  final Map<String, String> headers;
  http.Client _client = http.Client();

  TGHttpClient({this.headers = const {}}) {
    if (badCertificateCallbackEnabled && !kIsWeb) {
      HttpClient webHttpClient = HttpClient();
      webHttpClient.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
      _client = IOClient(webHttpClient);
    }
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(headers);
    return _client.send(request);
  }
}
