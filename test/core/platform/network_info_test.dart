import 'package:test/test.dart';
import 'package:news/core/platform/network_info_implementation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';

class MockInternetConnectionChecker extends Mock
    implements InternetConnectionChecker {}

void main() {
  late MockInternetConnectionChecker mockInternetConnectionChecker;
  late NetWorkInfoImplementation netWorkInfoImplementation;
  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    netWorkInfoImplementation =
        NetWorkInfoImplementation(mockInternetConnectionChecker);
  });
  group(
    "isConnection",
    () {
      test(
        "",
        () async {
          final hasConnection = Future.value(true);

          when(() => mockInternetConnectionChecker.hasConnection)
              .thenAnswer((_) => hasConnection);

          final result = netWorkInfoImplementation.isConnected;

          verify(() => mockInternetConnectionChecker.hasConnection);

          expect(result, completion(equals(true)));
        },
      );
    },
  );
}
