import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/data/datasources/search/contracts/search_local_data_source.dart';
import 'package:astronomy_picture/data/datasources/search/search_local_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../test_values.dart';
import 'search_local_data_source_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
void main() {
  late MockSharedPreferences sharedPreferences;
  late SearchLocalDataSource localDataSource;

  setUp(() {
    sharedPreferences = MockSharedPreferences();
    localDataSource =
        SearchLocalDataSourceImpl(sharedPreferences: sharedPreferences);
  });

  group("Function fetchSearchHistory", () {
    test("Should return a List of String", () async {
      when(sharedPreferences.getStringList(any))
          .thenReturn(tHistoryList());

      final result = await localDataSource.fetchSearchHistory();

      expect(result, tHistoryList());
    });

    test(
        "Should throw a AccessLocalDataFailure when the sharedPreferences failure",
        () async {
      when(sharedPreferences.getStringList(any))
          .thenThrow(Exception("Exception"));

      expect(() => localDataSource.fetchSearchHistory(),
          throwsA(isA<AccessLocalDataFailure>()));
    });
  });

  group("Function updateSearchHistory", () {
    test("Should return a List of String", () async {
      when(sharedPreferences.getStringList(any))
          .thenAnswer((_) => tHistoryList());
      when(sharedPreferences.setStringList(any, any))
          .thenAnswer((_) async => true);

      final result = await localDataSource.updateSearchHistory(tHistoryList());

      expect(result, tHistoryList());
    });

    test(
        "Should throw a AccessLocalDataFailure when the sharedPreferences failure",
        () async {
      when(sharedPreferences.getStringList(any))
          .thenAnswer((_) => tHistoryList());
      when(sharedPreferences.setStringList(any, any))
          .thenThrow(Exception("Exception"));

      expect(() => localDataSource.updateSearchHistory(tHistoryList()),
          throwsA(isA<AccessLocalDataFailure>()));
    });
  });
}
