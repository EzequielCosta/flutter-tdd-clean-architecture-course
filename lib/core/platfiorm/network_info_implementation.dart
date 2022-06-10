import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:news/core/platfiorm/network_info.dart';

class NetWorkInfoImplementation implements NetWorkInfo {
  @override
  Future<bool> get isConnected async {
    return await DataConnectionChecker().hasConnection;
  }
}
