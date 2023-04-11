import 'package:http/http.dart';
import 'package:prayaas_loans/services/service/request/tg_request.dart';

abstract class TGUploadRequest extends TGRequest {
  MultipartFile file();
}
