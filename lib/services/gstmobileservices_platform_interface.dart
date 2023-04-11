import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'gstmobileservices_method_channel.dart';

abstract class GstmobileservicesPlatform extends PlatformInterface {
  /// Constructs a GstmobileservicesPlatform.
  GstmobileservicesPlatform() : super(token: _token);

  static final Object _token = Object();

  static GstmobileservicesPlatform _instance = MethodChannelGstmobileservices();

  /// The default instance of [GstmobileservicesPlatform] to use.
  ///
  /// Defaults to [MethodChannelGstmobileservices].
  static GstmobileservicesPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GstmobileservicesPlatform] when
  /// they register themselves.
  static set instance(GstmobileservicesPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
