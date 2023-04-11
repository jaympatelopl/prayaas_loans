import 'package:intl/intl.dart';
import 'package:prayaas_loans/res/crypto_js.dart';
import 'package:prayaas_loans/services/common/tg_log.dart';
import 'package:prayaas_loans/services/model/comman/Metadat.dart';
import 'package:uuid/uuid.dart';

import '../model/comman/PayLoad.dart';

Future<PayLoad> getPayLoad(String request, String url) async {
  String getCurrentTimeStemp() {
    DateFormat dateFormat = DateFormat("dd-MM-yyyy HH:mm:ss");
    return dateFormat.format(DateTime.now());
  }

  var timeStemp = getCurrentTimeStemp();
  var uuid1 = const Uuid().v1().replaceAll("-", "");
  // var base64key = base64Encode(utf8.encode(uuid1));
  var encCryptedKey = encryptAESCryptoJS(uuid1);

  var data = request;
  var metadata = Metadata(encCryptedKey, "v1", timeStemp, uuid1);
  TGLog.d("Payload------------------$data");
  return PayLoad(payload: data, uri: url);
}
