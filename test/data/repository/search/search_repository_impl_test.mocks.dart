// Mocks generated by Mockito 5.4.2 from annotations
// in astronomy_picture/test/data/repository/search/search_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:astronomy_picture/data/datasources/search/contracts/search_local_data_source.dart'
    as _i5;
import 'package:astronomy_picture/data/datasources/search/contracts/search_remote_data_source.dart'
    as _i2;
import 'package:astronomy_picture/data/models/apod_model.dart' as _i4;
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

/// A class which mocks [SearchRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchRemoteDataSource extends _i1.Mock
    implements _i2.SearchRemoteDataSource {
  @override
  _i3.Future<List<_i4.ApodModel>> fetchApodByDateRange(
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
        returnValue: _i3.Future<List<_i4.ApodModel>>.value(<_i4.ApodModel>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i4.ApodModel>>.value(<_i4.ApodModel>[]),
      ) as _i3.Future<List<_i4.ApodModel>>);
}

/// A class which mocks [SearchLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchLocalDataSource extends _i1.Mock
    implements _i5.SearchLocalDataSource {
  @override
  _i3.Future<List<String>> fetchSearchHistory() => (super.noSuchMethod(
        Invocation.method(
          #fetchSearchHistory,
          [],
        ),
        returnValue: _i3.Future<List<String>>.value(<String>[]),
        returnValueForMissingStub: _i3.Future<List<String>>.value(<String>[]),
      ) as _i3.Future<List<String>>);

  @override
  _i3.Future<List<String>> updateSearchHistory(List<String>? history) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateSearchHistory,
          [history],
        ),
        returnValue: _i3.Future<List<String>>.value(<String>[]),
        returnValueForMissingStub: _i3.Future<List<String>>.value(<String>[]),
      ) as _i3.Future<List<String>>);
}
