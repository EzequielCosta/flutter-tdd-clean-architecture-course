import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news/core/platform/network_info.dart';

class NetWorkInfoImplementation implements NetWorkInfo {
  final InternetConnectionChecker connectionChecker;

  NetWorkInfoImplementation(this.connectionChecker);

  @override
  Future<bool> get isConnected async {
    return await connectionChecker.hasConnection;
  }
}
