import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/data/datasources/fetch_apods/fetch_apods_data_source.dart';
import 'package:astronomy_picture/data/repositories/fetch_apods/fetch_apods_repository_impl.dart';
import 'package:astronomy_picture/domain/entities/apod.dart';
import 'package:astronomy_picture/domain/repositories/fetch_apods/fetch_apods_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_values.dart';
import '../today_apod/today_apod_repository_impl_test.mocks.dart';
import 'fetch_apods_repository_impl_test.mocks.dart';


@GenerateNiceMocks([MockSpec<FetchApodsDataSource>()])
void main() {
  late MockFetchApodsDataSource fetchApodDataSource;
  late MockNetworkInfo networkInfo;
  late FetchApodsRepository repository;

  setUp(() {
    fetchApodDataSource = MockFetchApodsDataSource();
    networkInfo = MockNetworkInfo();
    repository = FetchApodsRepositoryImpl(
        fetchApodsDataSource: fetchApodDataSource, networkInfo: networkInfo);
  });

  group('function fetchApods', () {
    test("Should return a list of Apod entity on the Right side of Either",
        () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(fetchApodDataSource.fetchApods())
          .thenAnswer((_) async => tListApodModel());

      final result = await repository.fetchApods();

      result.fold((l) {
        fail("Test failed");
      }, (r) {
        expect(r, tListApodModel());
      });
    });

    test(
        "Should return an Failure entity throw by remoteDataDource on the Lefth side of Either",
        () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(fetchApodDataSource.fetchApods()).thenThrow((ApiFailure()));

      final result = await repository.fetchApods();

      expect(result, Left<Failure, Apod>(ApiFailure()));
    });

    test("Should return an NoConnection entity on the Lefth side of Either",
        () async {
      when(networkInfo.isConnected).thenAnswer((_) async => false);

      final result = await repository.fetchApods();

      verifyNever(fetchApodDataSource.fetchApods());

      expect(result, Left<Failure, Apod>(NoConnection()));
    });
  });
}