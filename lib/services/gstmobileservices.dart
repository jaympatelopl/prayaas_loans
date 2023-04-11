
import 'gstmobileservices_platform_interface.dart';

class Gstmobileservices {
  Future<String?> getPlatformVersion() {
    return GstmobileservicesPlatform.instance.getPlatformVersion();
  }
}
