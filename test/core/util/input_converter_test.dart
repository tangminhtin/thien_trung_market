import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thien_trung_market/core/error/failures.dart';
import 'package:thien_trung_market/core/util/input_converter.dart';

void main() {
  InputConverter? inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsignedInteger', () {
    test(
      'should return an integer when string represents an unsigned integer',
      () async {
        // arrange
        const String str = '123';
        // act
        final Either<Failure, int> result =
            inputConverter!.stringToUnsignedInteger(str);
        // assert
        expect(result, const Right(123));
      },
    );

    test(
      'should return a Failure when the string is not an integer',
      () async {
        // arrange
        const String str = 'abc';

        // act
        final Either<Failure, int> result =
            inputConverter!.stringToUnsignedInteger(str);

        // assert
        expect(result, Left(InvalidInputFailure()));
      },
    );

    test(
      'should return a Failure when the string i a negative integer',
      () async {
        // arrange
        const String str = '-123';

        // act
        final Either<Failure, int> result =
            inputConverter!.stringToUnsignedInteger(str);

        // assert
        expect(result, Left(InvalidInputFailure()));
      },
    );
  });
}
