import 'package:flutter_test/flutter_test.dart';
import 'package:thermalprint/thermalprint.dart';
import 'package:thermalprint/thermalprint_platform_interface.dart';
import 'package:thermalprint/thermalprint_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockThermalprintPlatform
    with MockPlatformInterfaceMixin
    implements ThermalprintPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> print(String text) {
    // TODO: implement print
    throw UnimplementedError();
  }
}

void main() {
  final ThermalprintPlatform initialPlatform = ThermalprintPlatform.instance;

  test('$MethodChannelThermalprint is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelThermalprint>());
  });

  test('getPlatformVersion', () async {
    Thermalprint thermalprintPlugin = Thermalprint();
    MockThermalprintPlatform fakePlatform = MockThermalprintPlatform();
    ThermalprintPlatform.instance = fakePlatform;

    expect(await thermalprintPlugin.getPlatformVersion(), '42');
  });
}
