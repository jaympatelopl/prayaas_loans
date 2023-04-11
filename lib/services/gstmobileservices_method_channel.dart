import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'gstmobileservices_platform_interface.dart';

/// An implementation of [GstmobileservicesPlatform] that uses method channels.
class MethodChannelGstmobileservices extends GstmobileservicesPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('gstmobileservices');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
