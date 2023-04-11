import 'package:prayaas_loans/services/model/models/get_otp_response_model.dart';
import 'package:prayaas_loans/services/service/response/tg_response.dart';

class GetOTPResponse extends TGResponse {
  GetOtpModel _getOtpModel = GetOtpModel();

  GetOTPResponse();

  GetOTPResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(dynamic json) {
    _getOtpModel = GetOtpModel.fromJson(json);
  }

  GetOtpModel getLoginResponseObj() {
    return _getOtpModel;
  }

  @override
  toJson(String str) {}
}
