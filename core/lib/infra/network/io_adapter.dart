import 'dart:io';

import 'package:core/data/network/network.dart';

class IOAdapter extends NetworkManager {
  @override
  Future<bool> hasConnectivity() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
