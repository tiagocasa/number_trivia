import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/src/core/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:number_trivia/src/core/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:number_trivia/src/core/number_trivia/data/models/number_trivia_model.dart';
import 'package:number_trivia/src/core/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:number_trivia/src/core/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/src/shared/error/exceptions.dart';
import 'package:number_trivia/src/shared/error/failure.dart';
import 'package:number_trivia/src/shared/services/network/network_info.dart';

class MockRemoteDataSource extends Mock
    implements NumberTriviaRemoteDataSource {}

class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  NumberTriviaRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  mockRemoteDataSource = MockRemoteDataSource();
  mockLocalDataSource = MockLocalDataSource();
  mockNetworkInfo = MockNetworkInfo();
  repository = NumberTriviaRepositoryImpl(
    remoteDataSource: mockRemoteDataSource,
    localDataSource: mockLocalDataSource,
    networkInfo: mockNetworkInfo,
  );
  void resetMocks() {
    reset(mockNetworkInfo);
    reset(mockLocalDataSource);
    reset(mockRemoteDataSource);
    repository = NumberTriviaRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  }

  group('getConcreteNumberTrivia', () {
    const tNumber = 1;
    const tNumberTriviaModel =
        NumberTriviaModel(number: tNumber, text: 'test text');
    const NumberTrivia tNumberTrivia = tNumberTriviaModel;
    setUp(() async {
      resetMocks();
      when(() => mockLocalDataSource.cacheNumberTrivia(tNumberTriviaModel))
          .thenAnswer((_) async => {});
    });

    group('Dispositivo online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('Deve verificar se o dispositivo esta online', () {
        when(() => mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
            .thenAnswer((_) async => tNumberTriviaModel);
        repository.getConcreteNumberTrivia(tNumber);

        verify(() => mockNetworkInfo.isConnected);
      });

      test('Deve retornar NumberTrivia quando a chamada tiver sucesso',
          () async {
        when(() => mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
            .thenAnswer((_) async => tNumberTriviaModel);
        final result = await repository.getConcreteNumberTrivia(tNumber);

        verify(() => mockRemoteDataSource.getConcreteNumberTrivia(tNumber));

        verify(() => mockLocalDataSource.cacheNumberTrivia(tNumberTriviaModel));
        expect(result, equals(const Right(tNumberTrivia)));
      });

      test('Deve retornar um ServerFailure quando a chamada não tiver sucesso',
          () async {
        when(() => mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
            .thenThrow(ServerExceptions());

        final result = await repository.getConcreteNumberTrivia(tNumber);

        verify(() => mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
        expect(result, equals(Left(ServerFailure())));
        verifyZeroInteractions(mockLocalDataSource);
      });
    });
    group('Dispositivo offline', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('Deve verificar se o dispositivo esta offline', () {
        when(() => mockLocalDataSource.getRandomNumberTriviaCached())
            .thenAnswer((_) async => tNumberTriviaModel);
        repository.getConcreteNumberTrivia(tNumber);

        verify(() => mockNetworkInfo.isConnected);
      });

      test('Deve retornar do banco local quando existe dados', () async {
        when(() => mockLocalDataSource.getRandomNumberTriviaCached())
            .thenAnswer((_) async => tNumberTriviaModel);

        final result = await repository.getConcreteNumberTrivia(tNumber);

        verifyZeroInteractions(mockRemoteDataSource);
        verify(
          () => mockLocalDataSource.getRandomNumberTriviaCached(),
        );
        expect(result, equals(const Right(tNumberTrivia)));
      });

      test('Deve retornar CacheFailure quando não existir no banco local',
          () async {
        when(() => mockLocalDataSource.getRandomNumberTriviaCached())
            .thenThrow(CacheExceptions());

        final result = await repository.getConcreteNumberTrivia(tNumber);

        verifyZeroInteractions(mockRemoteDataSource);
        verify(
          () => mockLocalDataSource.getRandomNumberTriviaCached(),
        );
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });

  group('getRandomNumberTrivia', () {
    const tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'test text');
    const NumberTrivia tNumberTrivia = tNumberTriviaModel;
    setUp(() async {
      resetMocks();
      when(() => mockLocalDataSource.cacheNumberTrivia(tNumberTriviaModel))
          .thenAnswer((_) async => {});
    });

    group('Dispositivo online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('Deve verificar se o dispositivo esta online', () async {
        when(() => mockRemoteDataSource.getRandomNumberTrivia())
            .thenAnswer((_) async => tNumberTriviaModel);
        await repository.getRandomNumberTrivia();

        verify(() => mockNetworkInfo.isConnected);
      });

      test('Deve retornar NumberTrivia quando a chamada tiver sucesso',
          () async {
        when(() => mockRemoteDataSource.getRandomNumberTrivia())
            .thenAnswer((_) async => tNumberTriviaModel);
        final result = await repository.getRandomNumberTrivia();

        verify(() => mockRemoteDataSource.getRandomNumberTrivia());

        verify(() => mockLocalDataSource.cacheNumberTrivia(tNumberTriviaModel));
        expect(result, equals(const Right(tNumberTrivia)));
      });

      test('Deve retornar um ServerFailure quando a chamada não tiver sucesso',
          () async {
        when(() => mockRemoteDataSource.getRandomNumberTrivia())
            .thenThrow(ServerExceptions());

        final result = await repository.getRandomNumberTrivia();

        verify(() => mockRemoteDataSource.getRandomNumberTrivia());
        expect(result, equals(Left(ServerFailure())));
        verifyZeroInteractions(mockLocalDataSource);
      });
    });
    group('Dispositivo offline', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('Deve verificar se o dispositivo esta offline', () async {
        when(() => mockLocalDataSource.getRandomNumberTriviaCached())
            .thenAnswer((_) async => tNumberTriviaModel);
        await repository.getRandomNumberTrivia();

        verify(() => mockNetworkInfo.isConnected);
      });

      test('Deve retornar do banco local quando existe dados', () async {
        when(() => mockLocalDataSource.getRandomNumberTriviaCached())
            .thenAnswer((_) async => tNumberTriviaModel);

        final result = await repository.getRandomNumberTrivia();

        verifyZeroInteractions(mockRemoteDataSource);
        verify(
          () => mockLocalDataSource.getRandomNumberTriviaCached(),
        );
        expect(result, equals(const Right(tNumberTrivia)));
      });

      test('Deve retornar CacheFailure quando não existir no banco local',
          () async {
        when(() => mockLocalDataSource.getRandomNumberTriviaCached())
            .thenThrow(CacheExceptions());

        final result = await repository.getRandomNumberTrivia();

        verifyZeroInteractions(mockRemoteDataSource);
        verify(
          () => mockLocalDataSource.getRandomNumberTriviaCached(),
        );
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });
}
