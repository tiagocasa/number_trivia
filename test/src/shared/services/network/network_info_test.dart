import 'package:flutter_test/flutter_test.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/src/shared/services/network/network_info.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  MockDataConnectionChecker mockDataConnectionChecker;
  NetworkInfoImpl networkInfo;

  mockDataConnectionChecker = MockDataConnectionChecker();
  networkInfo = NetworkInfoImpl(mockDataConnectionChecker);

  group('isConnected', () {
    test('Deve encaminhar a chamada para o DataConnectionChecker.hasConnection',
        () async {
      final tHasConnectionFuture = Future.value(true);

      when(() => mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnectionFuture);

      final result = networkInfo.isConnected;

      verify(() => mockDataConnectionChecker.hasConnection);
      expect(result, tHasConnectionFuture);
    });
  });
}
