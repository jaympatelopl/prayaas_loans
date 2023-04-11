import 'package:prayaas_loans/services/common/tg_log.dart';
import 'package:prayaas_loans/services/model/responsemodel/error/service_error.dart';
import 'package:prayaas_loans/services/model/responsemodel/get_otp_response.dart';
import 'package:prayaas_loans/services/model/responsemodel/login_response.dart';
import 'package:prayaas_loans/services/service/request/tg_post_request.dart';
import 'package:prayaas_loans/services/service/tg_service.dart';

class ServiceManager {
  static final ServiceManager _instance = ServiceManager();

  static ServiceManager getInstance() {
    return _instance;
  }

  void loginRequest({required TGPostRequest request, onSuccess, onError}) {
    TGLog.d("ServiceManager.LoginRequest---$request");
    TGService<LoginResponse, ServiceError>(() => LoginResponse(), () => ServiceError()).post(
      request: request,
      onSuccess: (response) => onSuccess!(response),
      onError: (error) => onError!(error),
    );
  }

  void loginRequestWithMobile({required TGPostRequest request, onSuccess, onError}) {
    TGLog.d("ServiceManager.LoginRequestWith mobile---$request");
    TGService<GetOTPResponse, ServiceError>(() => GetOTPResponse(), () => ServiceError()).post(
      request: request,
      onSuccess: (response) => onSuccess!(response),
      onError: (error) => onError!(error),
    );
  }
}
