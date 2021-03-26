import 'package:dio/dio.dart';
import 'package:gym_team/data/rest_client.dart';
import 'package:gym_team/data/rest_repository.dart';
import 'package:gym_team/domain/repository.dart';

class Injector {
  static Dio get _dio =>
      Dio()..interceptors.add(LogInterceptor(responseBody: false));

  static RestClient get _restClient =>
      RestClient(_dio, baseUrl: "https://run.mocky.io/v3");

  static Repository get repository => RestRepository(_restClient);
}
