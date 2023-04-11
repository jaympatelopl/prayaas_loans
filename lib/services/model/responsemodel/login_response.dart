import 'package:prayaas_loans/services/model/models/login_response_model.dart';
import 'package:prayaas_loans/services/service/response/tg_response.dart';

class LoginResponse extends TGResponse {
  LoginResponseModel _loginResponseModel = LoginResponseModel();

  LoginResponse();

  LoginResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(dynamic json) {
    _loginResponseModel = LoginResponseModel.fromJson(json);
  }

  LoginResponseModel getLoginResponseObj() {
    return _loginResponseModel;
  }

  @override
  toJson(String str) {}
}
