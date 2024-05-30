import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/data/datasources/search/contracts/search_local_data_source.dart';
import 'package:astronomy_picture/data/datasources/search/contracts/search_remote_data_source.dart';
import 'package:astronomy_picture/data/repositories/search/search_repository_impl.dart';
import 'package:astronomy_picture/domain/entities/apod.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_values.dart';
import '../today_apod/today_apod_repository_impl_test.mocks.dart';
import 'search_repository_impl_test.mocks.dart';

@GenerateNiceMocks(
    [MockSpec<SearchRemoteDataSource>(), MockSpec<SearchLocalDataSource>()])
void main() {
  late MockSearchLocalDataSource localDataSource;
  late MockSearchRemoteDataSource remoteDataSource;
  late MockNetworkInfo networkInfo;
  late SearchRepositoryImpl repository;

  setUp(() {
    localDataSource = MockSearchLocalDataSource();
    remoteDataSource = MockSearchRemoteDataSource();
    networkInfo = MockNetworkInfo();
    repository = SearchRepositoryImpl(
        localDataSource: localDataSource,
        remoteDataSource: remoteDataSource,
        networkInfo: networkInfo);
  });

  group('function fetchApodByDateRange', () {
    test("Should return a list of Apod entity on the Right side of Either",
        () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(remoteDataSource.fetchApodByDateRange(any, any))
          .thenAnswer((_) async => tListApodModel());

      final result =
          await repository.fetchApodByDateRange('2022-05-05', '2022-05-01');

      result.fold((l) {
        fail("Test - Failure");
      }, (r) {
        expect(r, tListApodModel());
      });
    });

    test(
        "Should return an Failure entity throw by remoteDataDource on the Lefth side of Either",
        () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(remoteDataSource.fetchApodByDateRange(any, any))
          .thenThrow(ApiFailure());

      final result =
          await repository.fetchApodByDateRange('2022-05-05', '2022-05-01');

      expect(result, Left<Failure, Apod>(ApiFailure()));
    });

    test("Should return an NoConnection entity on the Lefth side of Either",
        () async {
      when(networkInfo.isConnected).thenAnswer((_) async => false);

      final result =
          await repository.fetchApodByDateRange('2022-05-05', '2022-05-01');

      verifyNever(remoteDataSource.fetchApodByDateRange(any, any));

      expect(result, Left<Failure, Apod>(NoConnection()));
    });
  });

  group('function fetchSearchHistory', () {
    test("Should return a List of String on the Right side of Either",
        () async {
      when(localDataSource.fetchSearchHistory())
          .thenAnswer((_) async => tHistoryList());

      final result = await repository.fetchSearchHistory();

      result.fold((l) => fail("Test Failed"), (r) => expect(r, tHistoryList()));
    });

    test(
        "Should return an Failure throw by remoteDataDource on the Lefth side of Either",
        () async {
      when(localDataSource.fetchSearchHistory())
          .thenThrow(AccessLocalDataFailure());

      final result = await repository.fetchSearchHistory();

      expect(result, Left<Failure, List<String>>(AccessLocalDataFailure()));
    });
  });

  group('function updateSearchHistory', () {
    test("Should return a List of String on the Right side of Either",
        () async {
      when(localDataSource.updateSearchHistory(any))
          .thenAnswer((_) async => tHistoryList());

      final result = await repository.updateSearchHistory(tHistoryList());

      result.fold((l) => fail("Test Failed"), (r) => expect(r, tHistoryList()));
    });

    test(
        "Should return an Failure throw by remoteDataDource on the Lefth side of Either",
        () async {
      when(localDataSource.updateSearchHistory(any))
          .thenThrow(AccessLocalDataFailure());

      final result = await repository.updateSearchHistory(tHistoryList());

      expect(result, Left<Failure, List<String>>(AccessLocalDataFailure()));
    });
  });
}
