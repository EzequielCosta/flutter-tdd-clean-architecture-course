import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test/test.dart';

void main(List<String> args) async {
  test('Future.value() returns the value', () async {
    var value = await Future.value(10);
    expect(value, equals(10));

    // InternetConnectionChecker i = InternetConnectionChecker();
    // Future<bool> futureValue = Future.value(true);
    // Future<bool> checkHasInternet = i.hasConnection;
    // expect(equals(futureValue), checkHasInternet);
    //print(checkHasInternet == futureValue);
  });
}
