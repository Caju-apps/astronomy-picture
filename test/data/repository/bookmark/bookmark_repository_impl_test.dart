import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/core/success.dart';
import 'package:astronomy_picture/data/datasources/bookmark/bookmark_apod_data_source.dart';
import 'package:astronomy_picture/data/repositories/bookmark/bookmark_repository_impl.dart';
import 'package:astronomy_picture/domain/entities/apod.dart';
import 'package:astronomy_picture/domain/repositories/bookmark/bookmark_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_values.dart';
import 'bookmark_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<BookmarkApodDataSource>()])
void main() {
  late MockBookmarkApodDataSource dataSource;
  late BookmarkApodRepository repository;

  setUp(() {
    dataSource = MockBookmarkApodDataSource();
    repository = BookmarkApodRepositoryImpl(bookmarkApodDataSource: dataSource);
  });

  group('function saveApod', () {
    test("Should return a SuccessReturn on the Right side of Either", () async {
      when(dataSource.saveApod(any)).thenAnswer((_) async => ApodSaved());

      final result = await repository.saveApod(tApod());

      expect(result, Right<Failure, ApodSaved>(ApodSaved()));
    });

    test(
        "Should return an Failure throw by remoteDataDource on the Lefth side of Either",
        () async {
      when(dataSource.saveApod(any)).thenThrow(AccessLocalDataFailure());

      final result = await repository.saveApod(tApod());

      expect(result, Left<Failure, ApodSaved>(AccessLocalDataFailure()));
    });
  });

  group('function removeSaveApod', () {
    test("Should return a SuccessReturn on the Right side of Either", () async {
      when(dataSource.removeSaveApod(any))
          .thenAnswer((_) async => ApodRemoved());

      final result = await repository.removeSaveApod("date");

      expect(result, Right<Failure, ApodRemoved>(ApodRemoved()));
    });

    test(
        "Should return an Failure throw by remoteDataDource on the Lefth side of Either",
        () async {
      when(dataSource.removeSaveApod(any)).thenThrow(AccessLocalDataFailure());

      final result = await repository.removeSaveApod("date");

      expect(result, Left<Failure, ApodRemoved>(AccessLocalDataFailure()));
    });
  });

  group('function apodIsSave', () {
    test("Should return a SuccessReturn on the Right side of Either", () async {
      when(dataSource.apodIsSave(any)).thenAnswer((_) async => true);

      final result = await repository.apodIsSave("date");

      expect(result, const Right<Failure, bool>(true));
    });

    test(
        "Should return an Failure throw by remoteDataDource on the Lefth side of Either",
        () async {
      when(dataSource.apodIsSave(any)).thenThrow(AccessLocalDataFailure());

      final result = await repository.apodIsSave("date");

      expect(result, Left<Failure, bool>(AccessLocalDataFailure()));
    });
  });

  group('function fetchAllApodsSaved', () {
    test("Should return a SuccessReturn on the Right side of Either", () async {
      when(dataSource.getAllApodSave())
          .thenAnswer((_) async => tListApodModel());

      final result = await repository.fetchAllApodsSaved();

      result.fold(
          (l) => fail("Test Failed"), (r) => expect(r, tListApodModel()));
    });

    test(
        "Should return an Failure throw by remoteDataDource on the Lefth side of Either",
        () async {
      when(dataSource.getAllApodSave()).thenThrow(AccessLocalDataFailure());

      final result = await repository.fetchAllApodsSaved();

      expect(result, Left<Failure, List<Apod>>(AccessLocalDataFailure()));
    });
  });
}
