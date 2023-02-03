import 'package:connectivity_plus/connectivity_plus.dart';

enum Online {
  mobile,
  wifi,
  none,
}

class Utilities {
  isOnline() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    print('Online Status:');
    print(connectivityResult.toString());
    if (connectivityResult == ConnectivityResult.mobile) {
      return Online.mobile; // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return Online.wifi; // I am connected to a wifi network.
    }
    return Online.none;
  }
}
