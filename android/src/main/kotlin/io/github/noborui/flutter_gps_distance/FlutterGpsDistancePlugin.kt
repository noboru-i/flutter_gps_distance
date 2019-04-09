package io.github.noborui.flutter_gps_distance

import android.location.Location
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class FlutterGpsDistancePlugin: MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "flutter_gps_distance")
      channel.setMethodCallHandler(FlutterGpsDistancePlugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "calculateDistance") {
      val args = call.arguments as List<Double>
      print("start latitude : %f".format(args[0]));
      print("start longitude : %f".format(args[1]));
      print("end latitude : %f".format(args[2]));
      print("end longitude : %f".format(args[3]));

      val results = FloatArray(3)
      Location.distanceBetween(args[0], args[1], args[2], args[3], results);
      print("distance %f".format(results[0]))
      result.success(results[0])
    } else {
      result.notImplemented()
    }
  }
}
