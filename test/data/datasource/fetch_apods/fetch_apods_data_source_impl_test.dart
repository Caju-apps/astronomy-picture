import 'dart:convert';
import 'dart:io';

import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/data/datasources/fetch_apods/fetch_apods_data_source.dart';
import 'package:astronomy_picture/data/datasources/fetch_apods/fetch_apods_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../../fixtures/fixtures.dart';
import '../../../mocks/mocks.mocks.dart';
import '../../../test_values.dart';

void main() {
  late MockClient client;
  late FetchApodsDataSource fetchApodDataSource;

  setUp(() {
    client = MockClient();
    fetchApodDataSource = FetchApodsDataSourceImpl(client: client);
  });

  group("Function fetchApods", () {
    test("Should return a list Apod model", () async {
      http.Response tResponseSuccessList =
          http.Response.bytes(utf8.encode(fixture('apod_list.json')), 200);
      when(client.get(any)).thenAnswer((_) async => tResponseSuccessList);

      final result = await fetchApodDataSource.fetchApods();

      expect(result, tListApodModel());
    });

    test("Should throw an ApiFailure when API no return 500", () async {
      when(client.get(any)).thenAnswer(
          (_) async => http.Response.bytes(utf8.encode("erro"), 500));

      expect(() => fetchApodDataSource.fetchApods(), throwsA(isA<ApiFailure>()));
    });

    test("Should throw an ApiFailure when happen a exception", () async {
      when(client.get(any)).thenThrow(const SocketException("message"));

      expect(() => fetchApodDataSource.fetchApods(), throwsA(isA<ApiFailure>()));
    });
  });
}