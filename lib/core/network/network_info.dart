import 'package:data_connection_checker/data_connection_checker.dart';

/// Network Info
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

/// Network Info Implements
class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl({required this.connectionChecker});

  /// Get is connected
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
