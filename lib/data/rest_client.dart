import 'package:dio/dio.dart';
import 'package:gym_team/domain/entry.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/671450cf-cede-4098-a3c7-b24b6217a704")
  Future<List<Entity>> getEntries();
}
