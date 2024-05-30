import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/domain/repositories/bookmark/bookmark_repository.dart';
import 'package:astronomy_picture/domain/usecases/bookmark/apod_is_save.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'apod_is_save_test.mocks.dart';

@GenerateNiceMocks([MockSpec<BookmarkApodRepository>()])

void main() {
  late MockBookmarkApodRepository repository;
  late ApodIsSave usecase;

  setUp(() {
    repository = MockBookmarkApodRepository();
    usecase = ApodIsSave(repository: repository);
  });

  test('Should return a bool on  Right side of Either', () async {
    when(repository.apodIsSave(any))
        .thenAnswer((_) async => const Right<Failure, bool>(true));

    final result = await usecase("date");

    expect(result, const Right<Failure, bool>(true));
  });

  test('Should return an Failure on Left side of Either', () async {
    when(repository.apodIsSave(any)).thenAnswer(
        (_) async => Left<Failure, bool>(AccessLocalDataFailure()));

    final result = await usecase("date");

    expect(result, Left<Failure, bool>(AccessLocalDataFailure()));
  });
}