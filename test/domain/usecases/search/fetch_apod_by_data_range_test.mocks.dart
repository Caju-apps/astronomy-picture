// Mocks generated by Mockito 5.4.2 from annotations
// in astronomy_picture/test/domain/usecases/search/fetch_apod_by_data_range_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:astronomy_picture/core/failure.dart' as _i5;
import 'package:astronomy_picture/domain/entities/apod.dart' as _i6;
import 'package:astronomy_picture/domain/repositories/search/search_repository.dart'
    as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SearchRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchRepository extends _i1.Mock implements _i3.SearchRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Apod>>> fetchApodByDateRange(
    String? startDate,
    String? endDate,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchApodByDateRange,
          [
            startDate,
            endDate,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i6.Apod>>>.value(
            _FakeEither_0<_i5.Failure, List<_i6.Apod>>(
          this,
          Invocation.method(
            #fetchApodByDateRange,
            [
              startDate,
              endDate,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Apod>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Apod>>(
          this,
          Invocation.method(
            #fetchApodByDateRange,
            [
              startDate,
              endDate,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Apod>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<String>>> updateSearchHistory(
          List<String>? historyList) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateSearchHistory,
          [historyList],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<String>>>.value(
            _FakeEither_0<_i5.Failure, List<String>>(
          this,
          Invocation.method(
            #updateSearchHistory,
            [historyList],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<String>>>.value(
                _FakeEither_0<_i5.Failure, List<String>>(
          this,
          Invocation.method(
            #updateSearchHistory,
            [historyList],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<String>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<String>>> fetchSearchHistory() =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchSearchHistory,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<String>>>.value(
            _FakeEither_0<_i5.Failure, List<String>>(
          this,
          Invocation.method(
            #fetchSearchHistory,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<String>>>.value(
                _FakeEither_0<_i5.Failure, List<String>>(
          this,
          Invocation.method(
            #fetchSearchHistory,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<String>>>);
}
