import 'dart:convert';
import 'dart:io';

import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/data/datasources/search/contracts/search_remote_data_source.dart';
import 'package:astronomy_picture/data/datasources/search/search_remote_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../../fixtures/fixtures.dart';
import '../../../mocks/mocks.mocks.dart';
import '../../../test_values.dart';

void main() {
  late MockClient client;
  late SearchRemoteDataSource remoteDataSource;

  setUp(() {
    client = MockClient();
    remoteDataSource = SearchRemoteDataSourceImpl(client: client);
  });

  group("Function fetchApodByDateRange", () {
    test("Should return a list Apod model", () async {
      when(client.get(any)).thenAnswer((_) async =>
          http.Response.bytes(utf8.encode(fixture('apod_list.json')), 200));

      final result =
          await remoteDataSource.fetchApodByDateRange('2023-05-05', '2023-05-01');

      expect(result, tListApodModel());
    });

    test("Should throw an ApiFailure when API no return 500", () async {
      when(client.get(any)).thenAnswer((_) async =>
          http.Response.bytes(utf8.encode(fixture('apod_list.json')), 500));

      expect(
          () => remoteDataSource.fetchApodByDateRange('2023-05-05', '2023-05-01'),
          throwsA(isA<ApiFailure>()));
    });

    test("Should throw an ApiFailure when happen a exception", () async {
      when(client.get(any)).thenThrow(const SocketException("message"));

      expect(
          () => remoteDataSource.fetchApodByDateRange('2023-05-05', '2023-05-01'),
          throwsA(isA<ApiFailure>()));
    });
  });
}