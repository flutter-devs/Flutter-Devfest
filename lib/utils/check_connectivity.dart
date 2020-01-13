import 'package:connectivity/connectivity.dart';

Future<bool> checkConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    // I am connected to a mobile network.
    print("internet  available");
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    // I am connected to a wifi network.
    print("internet  available");
    return true;
  } else if (connectivityResult == ConnectivityResult.none) {
    // I am connected to a wifi network.
    print("internet not available");
    return false;
  } else {
    print("internet not available");
    return false;
  }
}
