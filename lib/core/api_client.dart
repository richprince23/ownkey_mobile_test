import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:ownkey_mobile_test/core/models/property.dart';

class PropertyService {
  static final PropertyService _instance = PropertyService._internal();
  final Dio _dio = Dio();

  factory PropertyService() {
    return _instance;
  }

  PropertyService._internal() {
    configureDio();
  }

  void configureDio() {
    // final dio = Dio();
    // (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };
    // Use this dio instance for your requests
  }

// fetch a single property
  Future<Property?> fetchProperty() async {
    configureDio();
    try {
      Response response =
          await _dio.get("https://test.api.ownkey.com.gh/v1/properties/");
      if (response.statusCode == 200) {
        return Property.fromJson(response.data);
      } else {
        throw Exception('Failed to load property');
      }
    } catch (e) {
      return null;
    }
  }

// fetch all new properties
  Future<List<Property>> fetchNewProperties() async {
    try {
      Response response =
          await _dio.get("https://test.api.ownkey.com.gh/v1/properties/new");
      if (response.statusCode == 200) {
        print(response.data);
        List<Property> properties = [];
        for (var item in response.data['result']) {
          properties.add(Property.fromJson(item));
        }
        return properties;
      } else {
        throw Exception('Failed to load properties');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('The server took too long to respond');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('The server took too long to respond');
      } else if (e.type == DioExceptionType.badResponse) {
        if (e.response?.statusCode == 404) {
          throw Exception('Resource not found');
        }
        if (e.response?.statusCode == 500) {
          throw Exception('Internal server error');
        }
        throw Exception(" Server responded with ${e.response?.statusCode}");
      } else if (e.type == DioExceptionType.badCertificate) {
        throw Exception('Oops! Something went wrong. It\'s not you, it\'s us.');
      } else {
        throw Exception('Oops! Something went wrong. Please try again');
      }
    } catch (e) {
      throw Exception("Oops! Something went wrong. Please try again");
    }
  }

  Future<List<Property>> getNewProperties() async {
    final http.Client client = http.Client();

    // try {
    final response = await client
        .get(Uri.parse("https://test.api.ownkey.com.gh/v1/properties/new"))
        .timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Response Timeout', 408); // Request Timeout response status code
      },
    );

    if (response.statusCode == 200) {
      List<Property> properties = [];
      var data = jsonDecode(response.body);

      for (var item in data) {
        properties.add(Property.fromJson(item));
      }
      return properties;
    } else {
      throw Exception('Failed to load properties');
    }
    // } on DioException catch (e) {
    //   if (e.type == DioExceptionType.connectionTimeout) {
    //     throw Exception('Connection Timeout Exception');
    //   } else if (e.type == DioExceptionType.receiveTimeout) {
    //     throw Exception('Receive Timeout Exception');
    //   } else if (e.type == DioExceptionType.badResponse) {
    //     throw Exception('Server responded with ${e.response?.statusCode}');
    //   } else if (e.type == DioExceptionType.badCertificate) {
    //     print('SSL certificate error: ${e.message}');
    //     throw Exception('Server responded with ${e.response?.statusCode}');
    //   } else {
    //     throw Exception('Unexpected error: ${e.message}');
    //   }
    // } catch (e) {
    //   print(e);
    //   throw Exception('Unexpected error: $e');
    // }
  }
}
