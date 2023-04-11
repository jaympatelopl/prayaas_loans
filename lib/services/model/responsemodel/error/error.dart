class Error {
  int? code;
  String? message;
  List? args;
  String? localeMessage;

  Error({
    this.code,
    this.message,
    this.args,
  });

  Error.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        message = json['message'],
        args = json['args'];
}
