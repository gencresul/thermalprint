import 'thermalprint_platform_interface.dart';

class Thermalprint {
  Future<String?> getPlatformVersion() {
    return ThermalprintPlatform.instance.getPlatformVersion();
  }

  Future<void> print(String text) {
    return ThermalprintPlatform.instance.print(text);
  }
}
