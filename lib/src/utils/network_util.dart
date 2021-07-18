import 'dart:io';

import 'package:appex_assignment/src/utils/flutter_toast.dart';
import 'package:connectivity/connectivity.dart';

class NetworkUtil {
  static Future<bool> isNetworkConnected() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        return true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        return true; // I am connected to a wifi network.
      } else if (connectivityResult == ConnectivityResult.none) {
        FlutterToast.showToast("Please check network connectivity and proceed");
        return false;
      }
      return false;
    } on SocketException catch (e) {
      return false;
    }
  }
}
