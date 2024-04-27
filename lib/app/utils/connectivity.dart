import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionStatus {
  getNormalStatus() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      print('I am connected to a mobile network ---------------');
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print('I am connected to a wifi network ---------------');
    } else {
      // Get.toNamed(Routes.NO_INTERNET);
    }
  }

  getAuthStatus() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      print('I am connected to a mobile network ---------------');
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print('I am connected to a wifi network ---------------');
    } else {
      // Get.toNamed(Routes.NO_INTERNET);
    }
  }
}

ConnectionStatus connectionStatus = ConnectionStatus();
