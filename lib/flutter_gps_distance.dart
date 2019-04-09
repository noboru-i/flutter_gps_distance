import 'dart:async';

import 'package:flutter/services.dart';

class FlutterGpsDistance {
  static const MethodChannel _channel =
      const MethodChannel('flutter_gps_distance');

  static Future<double> calculateDistance(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) async {
    final double distance = await _channel.invokeMethod('calculateDistance', [
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    ]);
    return distance;
  }
}
