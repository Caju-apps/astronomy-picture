import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/core/success.dart';
import 'package:astronomy_picture/domain/usecases/bookmark/apod_is_save.dart';
import 'package:astronomy_picture/domain/usecases/bookmark/fetch_all_apods_saved.dart';
import 'package:astronomy_picture/domain/usecases/bookmark/remove_save_apod.dart';
import 'package:astronomy_picture/domain/usecases/bookmark/save_apod.dart';
import 'package:astronomy_picture/presentation/bloc/bookmark/bookmark_apod_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../test_values.dart';
import 'bookmark_apod_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ApodIsSave>(),
  MockSpec<FetchAllApodSave>(),
  MockSpec<RemoveSaveApod>(),
  MockSpec<SaveApod>()
])
void main() {
  late MockApodIsSave apodIsSave;
  late MockFetchAllApodSave fetchAllApodSave;
  late MockRemoveSaveApod removeSaveApod;
  late MockSaveApod saveApod;
  late BookmarkApodBloc bloc;

  setUp(() {
    apodIsSave = MockApodIsSave();
    fetchAllApodSave = MockFetchAllApodSave();
    removeSaveApod = MockRemoveSaveApod();
    saveApod = MockSaveApod();
    bloc = BookmarkApodBloc(
        apodIsSave: apodIsSave,
        fetchAllApodSave: fetchAllApodSave,
        removeSaveApod: removeSaveApod,
        saveApod: saveApod);
  });

  group("usecase - ApodIsSave", () {
    test("Should emit LoadingApodState and IsSaveApodState", () {
      when(apodIsSave(any)).thenAnswer((_) async => const Right(true));

      bloc.input.add(const IsSaveBookmarkApodEvent(date: "date"));

      expect(
          bloc.stream,
          emitsInOrder([
            LoadingBookmarkApodState(),
            const IsSaveBookmarkApodState(wasSave: true)
          ]));
    });

    test("Should emit LoadingApodState and ErrorApodState", () {
      when(apodIsSave(any))
          .thenAnswer((_) async => Left(AccessLocalDataFailure()));

      bloc.input.add(const IsSaveBookmarkApodEvent(date: "date"));

      expect(
          bloc.stream,
          emitsInOrder([
            LoadingBookmarkApodState(),
            ErrorBookmarkApodState(msg: AccessLocalDataFailure().msg)
          ]));
    });
  });

  group("usecase - fetchAllApodSave", () {
    test("Should emit LoadingApodState and SuccessListApodState", () {
      when(fetchAllApodSave(any)).thenAnswer((_) async => Right(tListApod()));

      bloc.input.add(FetchAllSaveBookmarkApodEvent());

      expect(
          bloc.stream,
          emitsInOrder([
            LoadingBookmarkApodState(),
            SuccessListBookmarkApodState(list: tListApod())
          ]));
    });

    test("Should emit LoadingApodState and ErrorApodState", () {
      when(fetchAllApodSave(any))
          .thenAnswer((_) async => Left(AccessLocalDataFailure()));

      bloc.input.add(FetchAllSaveBookmarkApodEvent());

      expect(
          bloc.stream,
          emitsInOrder([
            LoadingBookmarkApodState(),
            ErrorBookmarkApodState(msg: AccessLocalDataFailure().msg)
          ]));
    });
  });

  group("usecase - removeSaveApod", () {
    test("Should emit LoadingApodState and RemoveSaveApodEvent", () {
      when(removeSaveApod(any)).thenAnswer((_) async => Right(ApodRemoved()));

      bloc.input.add(const RemoveSaveBookmarkApodEvent(date: "date"));

      expect(
          bloc.stream,
          emitsInOrder([
            LoadingBookmarkApodState(),
            LocalAccessSuccessBookmarkApodState(msg: ApodRemoved().msg)
          ]));
    });

    test("Should emit LoadingApodState and ErrorApodState", () {
      when(removeSaveApod(any))
          .thenAnswer((_) async => Left(AccessLocalDataFailure()));

      bloc.input.add(const RemoveSaveBookmarkApodEvent(date: "date"));

      expect(
          bloc.stream,
          emitsInOrder([
            LoadingBookmarkApodState(),
            ErrorBookmarkApodState(msg: AccessLocalDataFailure().msg)
          ]));
    });
  });

  group("usecase - saveApod", () {
    test("Should emit LoadingApodState and LocalAccessSuccessApodState", () {
      when(saveApod(any)).thenAnswer((_) async => Right(ApodSaved()));

      bloc.input.add(SaveBookmarkApodEvent(apod: tApod()));

      expect(
          bloc.stream,
          emitsInOrder([
            LoadingBookmarkApodState(),
            LocalAccessSuccessBookmarkApodState(msg: ApodSaved().msg)
          ]));
    });

    test("Should emit LoadingApodState and ErrorApodState", () {
      when(saveApod(any))
          .thenAnswer((_) async => Left(AccessLocalDataFailure()));

      bloc.input.add(SaveBookmarkApodEvent(apod: tApod()));

      expect(
          bloc.stream,
          emitsInOrder([
            LoadingBookmarkApodState(),
            ErrorBookmarkApodState(msg: AccessLocalDataFailure().msg)
          ]));
    });
  });
}
