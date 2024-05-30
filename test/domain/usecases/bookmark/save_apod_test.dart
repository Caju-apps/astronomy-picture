import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/core/success.dart';
import 'package:astronomy_picture/domain/usecases/bookmark/save_apod.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../test_values.dart';
import 'apod_is_save_test.mocks.dart';

void main() {
  late MockBookmarkApodRepository repository;
  late SaveApod usecase;

  setUp(() {
    repository = MockBookmarkApodRepository();
    usecase = SaveApod(repository: repository);
  });

  test('Should return a SuccessReturn on  Right side of Either', () async {
    when(repository.saveApod(any))
        .thenAnswer((_) async => Right<Failure, ApodSaved>(ApodSaved()));

    final result = await usecase(tApod());

    expect(result, Right<Failure, ApodSaved>(ApodSaved()));
  });

  test('Should return an Failure on Left side of Either', () async {
    when(repository.saveApod(any)).thenAnswer(
        (_) async => Left<Failure, ApodSaved>(AccessLocalDataFailure()));

    final result = await usecase(tApod());

    expect(result, Left<Failure, ApodSaved>(AccessLocalDataFailure()));
  });
}
