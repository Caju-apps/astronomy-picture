// Mocks generated by Mockito 5.4.2 from annotations
// in astronomy_picture/test/presentation/bookmark/bookmark_apod_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:astronomy_picture/core/failure.dart' as _i6;
import 'package:astronomy_picture/core/success.dart' as _i11;
import 'package:astronomy_picture/domain/entities/apod.dart' as _i8;
import 'package:astronomy_picture/domain/repositories/bookmark/bookmark_repository.dart'
    as _i2;
import 'package:astronomy_picture/domain/usecases/bookmark/apod_is_save.dart'
    as _i4;
import 'package:astronomy_picture/domain/usecases/bookmark/fetch_all_apods_saved.dart'
    as _i7;
import 'package:astronomy_picture/domain/usecases/bookmark/remove_save_apod.dart'
    as _i10;
import 'package:astronomy_picture/domain/usecases/bookmark/save_apod.dart'
    as _i12;
import 'package:astronomy_picture/domain/usecases/core/usecase.dart' as _i9;
import 'package:dartz/dartz.dart' as _i3;
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

class _FakeBookmarkApodRepository_0 extends _i1.SmartFake
    implements _i2.BookmarkApodRepository {
  _FakeBookmarkApodRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ApodIsSave].
///
/// See the documentation for Mockito's code generation for more information.
class MockApodIsSave extends _i1.Mock implements _i4.ApodIsSave {
  @override
  _i2.BookmarkApodRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeBookmarkApodRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeBookmarkApodRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.BookmarkApodRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, bool>> call(String? parameter) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [parameter],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
            _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #call,
            [parameter],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
                _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #call,
            [parameter],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, bool>>);
}

/// A class which mocks [FetchAllApodSave].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchAllApodSave extends _i1.Mock implements _i7.FetchAllApodSave {
  @override
  _i2.BookmarkApodRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeBookmarkApodRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeBookmarkApodRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.BookmarkApodRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i8.Apod>>> call(
          _i9.NoParameter? parameter) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [parameter],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, List<_i8.Apod>>>.value(
            _FakeEither_1<_i6.Failure, List<_i8.Apod>>(
          this,
          Invocation.method(
            #call,
            [parameter],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, List<_i8.Apod>>>.value(
                _FakeEither_1<_i6.Failure, List<_i8.Apod>>(
          this,
          Invocation.method(
            #call,
            [parameter],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i8.Apod>>>);
}

/// A class which mocks [RemoveSaveApod].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveSaveApod extends _i1.Mock implements _i10.RemoveSaveApod {
  @override
  _i2.BookmarkApodRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeBookmarkApodRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeBookmarkApodRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.BookmarkApodRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, _i11.ApodRemoved>> call(
          String? parameter) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [parameter],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, _i11.ApodRemoved>>.value(
                _FakeEither_1<_i6.Failure, _i11.ApodRemoved>(
          this,
          Invocation.method(
            #call,
            [parameter],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, _i11.ApodRemoved>>.value(
                _FakeEither_1<_i6.Failure, _i11.ApodRemoved>(
          this,
          Invocation.method(
            #call,
            [parameter],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i11.ApodRemoved>>);
}

/// A class which mocks [SaveApod].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveApod extends _i1.Mock implements _i12.SaveApod {
  @override
  _i2.BookmarkApodRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeBookmarkApodRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeBookmarkApodRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.BookmarkApodRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, _i11.ApodSaved>> call(
          _i8.Apod? parameter) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [parameter],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, _i11.ApodSaved>>.value(
            _FakeEither_1<_i6.Failure, _i11.ApodSaved>(
          this,
          Invocation.method(
            #call,
            [parameter],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, _i11.ApodSaved>>.value(
                _FakeEither_1<_i6.Failure, _i11.ApodSaved>(
          this,
          Invocation.method(
            #call,
            [parameter],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i11.ApodSaved>>);
}