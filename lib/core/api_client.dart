import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:ownkey_mobile_test/core/models/property.dart';

class PropertyService {
  static final PropertyService _instance = PropertyService._internal();
   Dio dio = Dio();

  factory PropertyService() {
    return _instance;
  }

  PropertyService._internal() {
    configureDio();
  }

  void configureDio() {
    // final dio = Dio();
    // (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };
    // Use this dio instance for your requests
  }


// fetch all new properties
  Future<List<Property>> fetchNewProperties() async {
    try {
      Response response =
          await dio.get("https://test.api.ownkey.com.gh/v1/properties/new");
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

  }
