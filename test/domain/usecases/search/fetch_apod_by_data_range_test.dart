import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/domain/entities/apod.dart';
import 'package:astronomy_picture/domain/repositories/search/search_repository.dart';
import 'package:astronomy_picture/domain/usecases/search/fetch_apod_by_data_range.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_values.dart';
import 'fetch_apod_by_data_range_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SearchRepository>()])
void main() {
  late MockSearchRepository repository;
  late FetchApodByDataRange usecase;

  setUp(() {
    repository = MockSearchRepository();
    usecase = FetchApodByDataRange(repository: repository);
  });

  test('Should return a list of Apod entity Right side of Either', () async {
    // cenario
    when(repository.fetchApodByDateRange(any, any))
        .thenAnswer((_) async => Right<Failure, List<Apod>>(tListApod()));

    // ação
    final result = await usecase("2022-05-05/2022-05-01");

    // esperado
    result.fold((l) {
      fail("Test failed");
    }, (r) {
      expect(r, tListApod());
    });
  });

  test('Should return an Failure on Left side of Either', () async {
    when(repository.fetchApodByDateRange(any, any))
        .thenAnswer((_) async => Left<Failure, List<Apod>>(NoConnection()));

    final result = await usecase("2022-05-05/2022-05-01");

    expect(result, Left<Failure, Apod>(NoConnection()));
  });

  test('Should return an Failure on Left side of Either for incorrect input',
      () async {
    final result = await usecase("2022-5-05/2022-05-1");

    expect(result, Left<Failure, Apod>(ConvertFailure()));
  });
}
