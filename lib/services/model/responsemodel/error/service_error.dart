



import '../../../service/error/tg_error.dart';
import '../error/error.dart';

class ServiceError extends TGError {
  int? status;
  String? message;
//  String? httpError;

 // Error? error;
  //List<Error>? errors;

 // bool? hasError;
 // bool? hasErrors;

  ServiceError({
    this.status,
    this.message,
   // this.httpError,
   // this.error,
  //  this.errors,
  //  this.hasError,
    //this.hasErrors,
  });

  @override
  ServiceError fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    //Error? _error;
   // List<Error>? _errors;

  //  dynamic _jsonError = json["error"];
   // List<dynamic>? _jsonErrors = json["errors"];

    // if (_jsonError != null) _error = Error.fromJson(_jsonError);
    // if (_jsonErrors != null && _jsonErrors.length > 0) {
    //   _errors = [];
    //   _jsonErrors.forEach((e) => _errors!.add(Error.fromJson(e)));
    // }

    return ServiceError(
        status: json["status"],
        message: json["message"]);
     //   httpError: json["httpError"],
       // error: _error,
       // errors: _errors,
        //hasError: (_error != null));
      //  hasErrors: (_errors != null && _errors.length > 0));
  }

  // String? localeMessage() {
  //   if (!hasError!) return "";
  //   return error?.localeMessage;
  // }
  //
  // List<String?> localeMessages() {
  //   if (!hasErrors!) return [];
  //   List<String?> localeMessages = [];
  //   errors!.forEach((error) => error.localeMessage != null
  //       ? localeMessages.add(error.localeMessage)
  //       : null);
  //   return localeMessages;
  // }
}
