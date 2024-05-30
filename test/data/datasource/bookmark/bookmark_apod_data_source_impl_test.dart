import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/core/success.dart';
import 'package:astronomy_picture/data/datasources/bookmark/bookmark_apod_data_source.dart';
import 'package:astronomy_picture/data/datasources/bookmark/bookmark_apod_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../fixtures/fixtures.dart';
import '../../../test_values.dart';
import '../search/search_local_data_source_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
void main() {
  late MockSharedPreferences sharedPreferences;
  late BookmarkApodDataSource localDataSource;

  setUp(() {
    sharedPreferences = MockSharedPreferences();
    localDataSource =
        BookmarkApodDataSourceImpl(preferences: sharedPreferences);
  });

  group("Function saveApod", () {
    test("Should return an ApodSaved", () async {
      when(sharedPreferences.setString(any, any)).thenAnswer((_) async => true);

      final result = await localDataSource.saveApod(tApodModel());

      expect(result, ApodSaved());
    });

    test("Should throw a SaveDataFailure when the sharedPreferences failure",
        () async {
      when(sharedPreferences.setString(any, any))
          .thenThrow(Exception("Exception"));

      expect(() => localDataSource.saveApod(tApodModel()),
          throwsA(isA<AccessLocalDataFailure>()));
    });
  });

  group("Function removeSaveApod", () {
    test("Should return an ApodSaveRemoved", () async {
      when(sharedPreferences.remove(any)).thenAnswer((_) async => true);

      final result = await localDataSource.removeSaveApod("2004-09-27");

      expect(result, ApodRemoved());
    });

    test("Should throw a RemoveDataFailure when the sharedPreferences failure",
        () async {
      when(sharedPreferences.remove(any)).thenThrow(Exception("Exception"));

      expect(() => localDataSource.removeSaveApod("2004-09-27"),
          throwsA(isA<AccessLocalDataFailure>()));
    });
  });

  group("Function apodIsSave", () {
    test("Should return a true", () async {
      when(sharedPreferences.containsKey(any)).thenAnswer((_) => true);

      final result = await localDataSource.apodIsSave("2004-09-27");

      expect(result, true);
    });

    test("Should return a false", () async {
      when(sharedPreferences.containsKey(any)).thenAnswer((_) => false);

      final result = await localDataSource.apodIsSave("2004-09-27");

      expect(result, false);
    });

    test(
        "Should throw a AccessLocalDataFailure when the sharedPreferences failure",
        () async {
      when(sharedPreferences.containsKey(any))
          .thenThrow(Exception("Exception"));

      expect(() => localDataSource.apodIsSave("2004-09-27"),
          throwsA(isA<AccessLocalDataFailure>()));
    });
  });

  group("Function getAllApodSave", () {
    test("Should return a List of ApodModel", () async {
      when(sharedPreferences.getKeys()).thenReturn({'chave1'});
      when(sharedPreferences.getString(any))
          .thenAnswer((_) => fixture('image_response.json'));

      final result = await localDataSource.getAllApodSave();

      expect(result, [tApodModel()]);
    });

    test("Should throw a RemoveDataFailure when the sharedPreferences failure",
        () async {
      when(sharedPreferences.getKeys()).thenReturn({'chave1'});
      when(sharedPreferences.getString(any)).thenThrow(Exception("Exception"));

      expect(() => localDataSource.getAllApodSave(),
          throwsA(isA<AccessLocalDataFailure>()));
    });

    test("Should throw a RemoveDataFailure when the sharedPreferences failure",
        () async {
      when(sharedPreferences.getKeys()).thenThrow(Exception("Exception"));
      when(sharedPreferences.getString(any))
          .thenAnswer((_) => fixture('image_response.json'));

      expect(() => localDataSource.getAllApodSave(),
          throwsA(isA<AccessLocalDataFailure>()));
    });
  });
}
