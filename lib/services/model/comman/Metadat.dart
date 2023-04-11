class Metadata {
  String? secretId;
  String? version;
  String? timestamp;
  String? requestId;

  Metadata(this.version, this.timestamp, this.requestId, this.secretId);

  Metadata.fromJson(Map<String, dynamic> json) {
    secretId = json['secretId'];
    version = json['version'];
    timestamp = json['timestamp'];
    requestId = json['requestId'];
  }

  Map<String, dynamic> toJson() => {
        'secretId': secretId,
        'version': version,
        'timestamp': timestamp,
        'requestId': requestId,
      };
}
