import 'dart:convert';

import '../../service/request/tg_post_request.dart';

class PayLoad extends TGPostRequest {
  // Metadata? metadata;
  String? payload;
  String? uri;

  PayLoad({this.payload, required this.uri});

  PayLoad.fromJson(Map<String, dynamic> json) {
    payload = json['payload'];
    uri = json['uri'];
    // metadata = Metadata.fromJson(json['metadata']);
  }

  Map<String, dynamic> toJson() => {
        // 'metadata': metadata?.toJson(),
        'payload': payload,
        'uri': uri,
      };

  @override
  String body() {
    return json.encode(toJson());
  }

  @override
  String getUri() {
    return uri!;
  }
}
