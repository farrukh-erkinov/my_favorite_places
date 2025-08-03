import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:surf_places/api/data/place_dto.dart';
import 'package:surf_places/api/service/api_urls.dart';

part 'api_client.g.dart';

/// REST-клиент.
@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  /// Получение списка мест.
  @GET(ApiUrls.places)
  Future<List<PlaceDto>> getPlaces();
}
