
import 'package:connectivity_plus/connectivity_plus.dart';

mixin ConnectivityUtil {
  static Future<bool> isNetworkConnected() async {
    final connectivity = await Connectivity().checkConnectivity();
    return !connectivity.contains(ConnectivityResult.none);
  }
}
