import 'dart:io';

import 'package:dio/dio.dart';
import 'package:inabe/src/data/dto/request/login_request.dart';
import 'package:inabe/src/data/dto/request/user_request.dart';
import 'package:inabe/src/data/dto/response/electronic_app_response.dart';
import 'package:inabe/src/data/dto/response/interest_response.dart';
import 'package:inabe/src/data/dto/response/living_guide_response.dart';
import 'package:inabe/src/data/dto/response/other_app_response.dart';
import 'package:inabe/src/data/dto/response/user_response.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: "http://35.77.55.121/api/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("auth/sign_in")
  Future<HttpResponse<UserResponse>> login(@Body() LoginRequest loginRequest);

  @POST("auth")
  Future<UserResponse> register(@Body() UserRequest userRequest);

  @GET("interests")
  Future<InterestResponse> interests();

  @GET("living_guides")
  Future<LivingGuideResponse> livingGuides();

  @GET("other_apps")
  Future<OtherAppResponse> otherApps();

  @GET("electronic_applications")
  Future<ElectronicAppResponse> electronicApps();
}
