import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/src/shared/util/input_converter.dart';

void main() {
  InputConverter inputConverter;

  inputConverter = InputConverter();

  group('stingToUnsignedInt', () {
    test('Deve retornar um int quando a String for int', () async {
      const str = '123';
      final result = inputConverter.stringtoUnisgnedInteger(str);
      expect(result, const Right(123));
    });
    test('Deve retornar um failure quando a String não for um int', () async {
      const str = 'asb';
      final result = inputConverter.stringtoUnisgnedInteger(str);
      expect(result, Left(InvalidInputFailure()));
    });
    test('Deve retornar um failure quando for um int negativo', () async {
      const str = '-1';
      final result = inputConverter.stringtoUnisgnedInteger(str);
      expect(result, Left(InvalidInputFailure()));
    });
  });
}
