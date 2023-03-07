import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_inabe_client.g.dart';

@RestApi(baseUrl: "https://www.city.inabe.mie.jp")
abstract class RestInabeClient {
  factory RestInabeClient(Dio dio, {String baseUrl}) = _RestInabeClient;

  //Login
  @Header("Content-Type: text/xml")
  @GET("/event.xml")
  Future<String> getEventData();
}
