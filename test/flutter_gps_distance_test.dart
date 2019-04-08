import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gps_distance/flutter_gps_distance.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_gps_distance');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterGpsDistance.platformVersion, '42');
  });
}
