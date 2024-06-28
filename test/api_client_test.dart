import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart';
import 'package:ownkey_mobile_test/core/api_client.dart';
import 'package:ownkey_mobile_test/core/models/property.dart';

// This will generate the MockDio class
import 'api_client_test.mocks.dart';

@GenerateMocks([Dio])
// import 'property_service_test.mocks.dart';

void main() {
  late PropertyService propertyService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    propertyService = PropertyService();
    propertyService.dio = mockDio;
  });

  group('PropertyService', () {
    test('fetchNewProperties returns list of properties on success', () async {
      // Arrange
      final responseData = {
        'result': [
          {
            "created_at": "2024-05-28T19:23:28.864693Z",
            "updated_at": "2024-05-28T20:09:08.261107Z",
            "slug": "sample-property-207940908",
            "name": "Sample Property",
            "price": 1000,
            "currency": "GHC",
            "discount": 0,
            "leasing": "FOR RENT",
            "securityDeposit": 2000,
            "availableDate": "2024-05-28T00:00:00Z",
            "availability": true,
            "streetAddress": "Ghana",
            "leaseTermDescription": "Rent terms",
            "leaseDuration": 24,
            "type": {
              "created_at": "2024-03-11T15:33:54.640576Z",
              "updated_at": "2024-04-22T12:28:20.887419Z",
              "slug": "hotel-2096687250",
              "name": "Hotel",
              "main_type": "COMMERCIAL"
            },
            "desc": "Property Description edit",
            "status": "accepted",
            "hideAddress": false,
            "negotiable": false,
            "published": true,
            "property_amenities": [
              {
                "id": 704937339,
                "created_at": "2024-05-28T19:41:29.51747Z",
                "amenity": {
                  "created_at": "2024-04-22T12:12:11.531914Z",
                  "updated_at": "2024-04-22T12:12:11.531914Z",
                  "slug": "bedrooms-1998513927",
                  "name": "Bedrooms",
                  "icon_url": "",
                  "meta": "NUMBER"
                },
                "data": {"value": "5"}
              },
              {
                "id": 2291230900,
                "created_at": "2024-05-28T19:41:29.51747Z",
                "amenity": {
                  "created_at": "2024-03-28T11:58:15.556407Z",
                  "updated_at": "2024-03-28T11:58:15.556407Z",
                  "slug": "parking-1690373990",
                  "name": "Parking",
                  "icon_url": "",
                  "meta": "NUMBER"
                },
                "data": {"value": "1"}
              },
              {
                "id": 854242279,
                "created_at": "2024-05-28T19:41:29.51747Z",
                "amenity": {
                  "created_at": "2024-03-12T09:04:45.817607Z",
                  "updated_at": "2024-05-06T12:17:28.423931Z",
                  "slug": "washing-machine-2057020119",
                  "name": "Washing Machine",
                  "icon_url":
                      "https://mosgqwgurpgyzzsdixks.supabase.co/storage/v1/object/public/ownkey_bucket_staging/amenities/fa0aacd2-8ec1-4694-b9aa-198f3c41fc65-2057020119.png",
                  "meta": "TEXT"
                },
                "data": {"value": false}
              },
              {
                "id": 1849140220,
                "created_at": "2024-05-28T19:41:29.51747Z",
                "amenity": {
                  "created_at": "2024-03-12T18:00:37.591158Z",
                  "updated_at": "2024-05-06T12:28:53.481906Z",
                  "slug": "bathrooms-2580258350",
                  "name": "Bathrooms",
                  "icon_url":
                      "https://mosgqwgurpgyzzsdixks.supabase.co/storage/v1/object/public/ownkey_bucket_staging/amenities/bb0f4f16-419a-4383-a549-09f4f0624604-2580258350.png",
                  "meta": "NUMBER"
                },
                "data": {"value": false}
              },
              {
                "id": 431460867,
                "created_at": "2024-05-28T19:41:29.51747Z",
                "amenity": {
                  "created_at": "2024-03-12T18:00:57.250101Z",
                  "updated_at": "2024-06-21T04:39:37.452953Z",
                  "slug": "bathrooms-1884839414",
                  "name": "Bathrooms",
                  "icon_url":
                      "https://mosgqwgurpgyzzsdixks.supabase.co/storage/v1/object/public/ownkey_bucket_staging/amenities/72b3d322-df73-4f97-8fd4-a575b57eb288-1884839414.jpeg",
                  "meta": "NUMBER"
                },
                "data": {"value": false}
              },
              {
                "id": 2306521506,
                "created_at": "2024-05-28T19:41:29.51747Z",
                "amenity": {
                  "created_at": "2024-03-28T11:59:22.820934Z",
                  "updated_at": "2024-04-10T10:41:58.885154Z",
                  "slug": "meeting-room-2422312737",
                  "name": "Meeting Room",
                  "icon_url":
                      "https://mosgqwgurpgyzzsdixks.supabase.co/storage/v1/object/public/ownkey_bucket_staging/amenities/e0f396d3-66d9-4b98-a8f4-b0558ba442d1-2422312737.svg+xml",
                  "meta": "UNIT"
                },
                "data": {"value": false}
              },
              {
                "id": 2497026882,
                "created_at": "2024-05-28T19:41:29.51747Z",
                "amenity": {
                  "created_at": "2024-05-08T09:35:14.601357Z",
                  "updated_at": "2024-05-08T09:35:14.601357Z",
                  "slug": "washing-machine-4-1250863147",
                  "name": "Washing Machine 4",
                  "icon_url": "",
                  "meta": "TEXT"
                },
                "data": {"value": false}
              },
              {
                "id": 340952325,
                "created_at": "2024-05-28T19:41:29.51747Z",
                "amenity": {
                  "created_at": "2024-03-22T11:59:43.012596Z",
                  "updated_at": "2024-03-22T11:59:43.012596Z",
                  "slug": "pool-1215062909",
                  "name": "Pool",
                  "icon_url": "",
                  "meta": "NUMBER"
                },
                "data": {"value": false}
              }
            ],
            "attributes": [
              {
                "created_at": "2024-04-23T07:19:48.749636Z",
                "updated_at": "2024-04-23T07:19:48.749636Z",
                "slug": "affordable-2557144063",
                "name": "Affordable"
              }
            ],
            "location": {
              "id": 2494323781,
              "created_at": "2024-05-28T19:23:29.148524Z",
              "latitude": 7.946527,
              "longitude": -1.023194,
              "country": "Ghana",
              "city": "",
              "state": "Ghana"
            },
            "images": [
              "https://mosgqwgurpgyzzsdixks.supabase.co/storage/v1/object/public/ownkey_bucket_staging/properties/1-image-207940908.jpeg",
              "https://mosgqwgurpgyzzsdixks.supabase.co/storage/v1/object/public/ownkey_bucket_staging/properties/0-image-207940908.jpeg"
            ]
          },
          {
            "created_at": "2024-06-05T18:21:39.578828Z",
            "updated_at": "2024-06-05T18:43:26.484904Z",
            "slug": "newly-built-4-bedroom-house-1551823118",
            "name": "Newly Built 4-Bedroom House",
            "price": 16000000,
            "currency": "GHC",
            "discount": 0,
            "leasing": "FOR SALE",
            "availableDate": "2024-06-05T00:00:00Z",
            "availability": true,
            "streetAddress": "Kpone Barrier Rd, Tema, Ghana",
            "type": {
              "created_at": "2024-03-11T15:33:54.640576Z",
              "updated_at": "2024-04-22T12:28:20.887419Z",
              "slug": "hotel-2096687250",
              "name": "Hotel",
              "main_type": "COMMERCIAL"
            },
            "desc":
                "Newly Built 4-Bedroom located in the heart of the Kpone-Katamanso region. Fully furnished with electricity connectivity and access to water.",
            "status": "accepted",
            "hideAddress": false,
            "negotiable": false,
            "published": true,
            "property_amenities": [
              {
                "id": 1468701411,
                "created_at": "2024-06-05T18:42:03.660663Z",
                "amenity": {
                  "created_at": "2024-04-22T12:12:11.531914Z",
                  "updated_at": "2024-04-22T12:12:11.531914Z",
                  "slug": "bedrooms-1998513927",
                  "name": "Bedrooms",
                  "icon_url": "",
                  "meta": "NUMBER"
                },
                "data": {"value": "4"}
              },
              {
                "id": 662712054,
                "created_at": "2024-06-05T18:42:03.660663Z",
                "amenity": {
                  "created_at": "2024-03-28T11:58:15.556407Z",
                  "updated_at": "2024-03-28T11:58:15.556407Z",
                  "slug": "parking-1690373990",
                  "name": "Parking",
                  "icon_url": "",
                  "meta": "NUMBER"
                },
                "data": {"value": "16"}
              },
              {
                "id": 2491401292,
                "created_at": "2024-06-05T18:42:03.660663Z",
                "amenity": {
                  "created_at": "2024-03-12T09:04:45.817607Z",
                  "updated_at": "2024-05-06T12:17:28.423931Z",
                  "slug": "washing-machine-2057020119",
                  "name": "Washing Machine",
                  "icon_url":
                      "https://mosgqwgurpgyzzsdixks.supabase.co/storage/v1/object/public/ownkey_bucket_staging/amenities/fa0aacd2-8ec1-4694-b9aa-198f3c41fc65-2057020119.png",
                  "meta": "TEXT"
                },
                "data": {"value": true}
              },
              {
                "id": 144674147,
                "created_at": "2024-06-05T18:42:03.660663Z",
                "amenity": {
                  "created_at": "2024-03-12T18:00:37.591158Z",
                  "updated_at": "2024-05-06T12:28:53.481906Z",
                  "slug": "bathrooms-2580258350",
                  "name": "Bathrooms",
                  "icon_url":
                      "https://mosgqwgurpgyzzsdixks.supabase.co/storage/v1/object/public/ownkey_bucket_staging/amenities/bb0f4f16-419a-4383-a549-09f4f0624604-2580258350.png",
                  "meta": "NUMBER"
                },
                "data": {"value": false}
              },
              {
                "id": 2977870006,
                "created_at": "2024-06-05T18:42:03.660663Z",
                "amenity": {
                  "created_at": "2024-03-12T18:00:57.250101Z",
                  "updated_at": "2024-06-21T04:39:37.452953Z",
                  "slug": "bathrooms-1884839414",
                  "name": "Bathrooms",
                  "icon_url":
                      "https://mosgqwgurpgyzzsdixks.supabase.co/storage/v1/object/public/ownkey_bucket_staging/amenities/72b3d322-df73-4f97-8fd4-a575b57eb288-1884839414.jpeg",
                  "meta": "NUMBER"
                },
                "data": {"value": false}
              },
              {
                "id": 2730948417,
                "created_at": "2024-06-05T18:42:03.660663Z",
                "amenity": {
                  "created_at": "2024-03-28T11:59:22.820934Z",
                  "updated_at": "2024-04-10T10:41:58.885154Z",
                  "slug": "meeting-room-2422312737",
                  "name": "Meeting Room",
                  "icon_url":
                      "https://mosgqwgurpgyzzsdixks.supabase.co/storage/v1/object/public/ownkey_bucket_staging/amenities/e0f396d3-66d9-4b98-a8f4-b0558ba442d1-2422312737.svg+xml",
                  "meta": "UNIT"
                },
                "data": {"value": false}
              },
              {
                "id": 460038429,
                "created_at": "2024-06-05T18:42:03.660663Z",
                "amenity": {
                  "created_at": "2024-05-08T09:35:14.601357Z",
                  "updated_at": "2024-05-08T09:35:14.601357Z",
                  "slug": "washing-machine-4-1250863147",
                  "name": "Washing Machine 4",
                  "icon_url": "",
                  "meta": "TEXT"
                },
                "data": {"value": false}
              },
              {
                "id": 3281904218,
                "created_at": "2024-06-05T18:42:03.660663Z",
                "amenity": {
                  "created_at": "2024-03-22T11:59:43.012596Z",
                  "updated_at": "2024-03-22T11:59:43.012596Z",
                  "slug": "pool-1215062909",
                  "name": "Pool",
                  "icon_url": "",
                  "meta": "NUMBER"
                },
                "data": {"value": true}
              }
            ],
            "attributes": [
              {
                "created_at": "2024-04-23T07:19:48.749636Z",
                "updated_at": "2024-04-23T07:19:48.749636Z",
                "slug": "affordable-homes-3515270084",
                "name": "Affordable Homes"
              }
            ],
            "location": {
              "id": 2786601996,
              "created_at": "2024-06-05T18:21:39.87145Z",
              "latitude": 5.7241898,
              "longitude": 0.0001334,
              "country": "Ghana",
              "city": "Tema",
              "state": "Kpone Barrier Rd, Tema, Ghana"
            },
            "images": [
              "https://mosgqwgurpgyzzsdixks.supabase.co/storage/v1/object/public/ownkey_bucket_staging/properties/3-image-1551823118.jpeg",
              "https://mosgqwgurpgyzzsdixks.supabase.co/storage/v1/object/public/ownkey_bucket_staging/properties/0-image-1551823118.jpeg",
              "https://mosgqwgurpgyzzsdixks.supabase.co/storage/v1/object/public/ownkey_bucket_staging/properties/2-image-1551823118.jpeg",
              "https://mosgqwgurpgyzzsdixks.supabase.co/storage/v1/object/public/ownkey_bucket_staging/properties/1-image-1551823118.jpeg"
            ]
          },
          ]
      };
      when(mockDio.get('https://test.api.ownkey.com.gh/v1/properties/new'))
          .thenAnswer((_) async => Response(
                data: responseData,
                statusCode: 200,
                requestOptions: RequestOptions(path: ''),
              ));

      // Act
      final result = await propertyService.fetchNewProperties();

      // Assert
      expect(result, isA<List<Property>>());
      expect(result.length, 2);
      expect(result[0].location!.country, 'Ghana');
      expect(result[1].name, 'Newly Built 4-Bedroom House');
    });

    test('fetchNewProperties throws exception on non-200 status code',
        () async {
      // Arrange
      when(mockDio.get('https://test.api.ownkey.com.gh/v1/properties/new'))
          .thenAnswer((_) async => Response(
                statusCode: 404,
                requestOptions: RequestOptions(path: ''),
              ));

      // Act & Assert
      expect(propertyService.fetchNewProperties(), throwsException);
    });

    test('fetchNewProperties handles DioException - connectionTimeout',
        () async {
      // Arrange
      when(mockDio.get('https://test.api.ownkey.com.gh/v1/properties/new'))
          .thenThrow(DioException(
        type: DioExceptionType.connectionTimeout,
        requestOptions: RequestOptions(path: ''),
      ));

      // Act & Assert
      expect(
        propertyService.fetchNewProperties(),
        throwsA(isA<Exception>().having(
          (e) => e.toString(),
          'message',
          contains('The server took too long to respond'),
        )),
      );
    });

    test('fetchNewProperties handles DioException - badResponse', () async {
      // Arrange
      when(mockDio.get('https://test.api.ownkey.com.gh/v1/properties/new'))
          .thenThrow(DioException(
        type: DioExceptionType.badResponse,
        response: Response(
          statusCode: 500,
          requestOptions: RequestOptions(path: ''),
        ),
        requestOptions: RequestOptions(path: ''),
      ));

      // Act & Assert
      expect(
        propertyService.fetchNewProperties(),
        throwsA(isA<Exception>().having(
          (e) => e.toString(),
          'message',
          contains('Internal server error'),
        )),
      );
    });

    test('fetchNewProperties handles general exceptions', () async {
      // Arrange
      when(mockDio.get('https://test.api.ownkey.com.gh/v1/properties/new'))
          .thenThrow(Exception('Unknown error'));

      // Act & Assert
      expect(
        propertyService.fetchNewProperties(),
        throwsA(isA<Exception>().having(
          (e) => e.toString(),
          'message',
          contains('Oops! Something went wrong. Please try again'),
        )),
      );
    });
  });
}
