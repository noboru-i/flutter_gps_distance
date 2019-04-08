import 'dart:async';

import 'package:flutter/services.dart';

class FlutterGpsDistance {
  static const MethodChannel _channel =
      const MethodChannel('flutter_gps_distance');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
