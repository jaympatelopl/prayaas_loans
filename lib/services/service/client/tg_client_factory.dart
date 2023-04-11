import 'package:http/http.dart';
import 'package:prayaas_loans/services/service/client/tg_http_client.dart';
import 'package:prayaas_loans/services/service/client/tg_mock_client.dart';
import 'package:prayaas_loans/services/service/mock/tg_mock_mapping_vo.dart';
import 'package:prayaas_loans/services/service/mock/tg_mock_service.dart';

class TGClientFactory {
  static Client getClient(String uri, String method) {
    if (TGMockService.shouldApplyMock(uri, method)!) {
      return TGMockClient(getMockClientHandler);
    } else {
      return TGHttpClient();
    }
  }

  static Future<Response> getMockClientHandler(Request request) async {
    TGMockMappingVO? mockMappingVO = TGMockService.getMockMappingVO(request.url.toString(), request.method);
    if (mockMappingVO != null) {
      await Future.delayed(const Duration(seconds: 1));
      String responseString = (mockMappingVO.httpStatus! >= 200 && mockMappingVO.httpStatus! <= 299)
          ? mockMappingVO.successString
          : mockMappingVO.errorString;
      return Response(responseString, mockMappingVO.httpStatus!);
    } else {
      throw Exception("ERROR: Unable to find MockMapping for ${request.url}");
    }
  }
}
