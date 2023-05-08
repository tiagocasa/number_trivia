import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/src/core/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:number_trivia/src/core/number_trivia/data/models/number_trivia_model.dart';
import 'package:number_trivia/src/shared/services/realm/number_trivia_realm.dart';
import 'package:realm/realm.dart';

class MockRealm extends Mock implements Realm {}

void main() {
  MockRealm mockRealm;
  NumberTriviaLocalDataSourceImpl localDataSource;

  mockRealm = MockRealm();

  localDataSource = NumberTriviaLocalDataSourceImpl(mockRealm);

  group('Random Local Trivia', () {
    const tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'test text');
    const triviaResults = RealmResults<NumberTriviaRealm>;

    test('Deve Receber uma trivia aleatoria', () async {});
  });
}
