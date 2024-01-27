import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'thermalprint_platform_interface.dart';

/// An implementation of [ThermalprintPlatform] that uses method channels.
class MethodChannelThermalprint extends ThermalprintPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('thermalprint');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> print(String text) async {
    try {
      await methodChannel.invokeMethod('print', {'text': text});
    } on PlatformException catch (e) {
      // Hata işleme
      print("Yazdırma hatası: '${e.message}'.");
    }
  }
}
