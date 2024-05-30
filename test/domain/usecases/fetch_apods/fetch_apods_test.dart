import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/domain/repositories/fetch_apods/fetch_apods_repository.dart';
import 'package:astronomy_picture/domain/usecases/core/usecase.dart';
import 'package:astronomy_picture/domain/entities/apod.dart';
import 'package:astronomy_picture/domain/usecases/fetch_apods/fetch_apods.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_values.dart';
import 'fetch_apods_test.mocks.dart';


@GenerateNiceMocks([MockSpec<FetchApodsRepository>()])
void main() {
  late MockFetchApodsRepository repository;
  late FetchApods usecase;

  setUp(() {
    repository = MockFetchApodsRepository();
    usecase = FetchApods(repository: repository);
  });

  test('Should return a list of Apod entity Right side of Either', () async {
    when(repository.fetchApods())
        .thenAnswer((_) async => Right<Failure, List<Apod>>(tListApod()));

    final result = await usecase(NoParameter());

    result.fold((l) {
      fail("Test failed");
    }, (r) {
      expect(r, tListApod());
    });
  });

  test('Should return an Failure on Left side of Either', () async {
    when(repository.fetchApods())
        .thenAnswer((_) async => Left<Failure, List<Apod>>(NoConnection()));

    final result = await usecase(NoParameter());

    expect(result, Left<Failure, Apod>(NoConnection()));
  });
}