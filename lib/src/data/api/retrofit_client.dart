import 'package:dio/dio.dart';
import 'package:inabe/src/data/dto/request/forgot_password_request.dart';
import 'package:inabe/src/data/dto/request/login_request.dart';
import 'package:inabe/src/data/dto/request/otp_request.dart';
import 'package:inabe/src/data/dto/request/update_user_info_request.dart';
import 'package:inabe/src/data/dto/request/update_user_request.dart';
import 'package:inabe/src/data/dto/request/user_request.dart';
import 'package:inabe/src/data/dto/response/electronic_app_response.dart';
import 'package:inabe/src/data/dto/response/email_response.dart';
import 'package:inabe/src/data/dto/response/faq_response.dart';
import 'package:inabe/src/data/dto/response/interest_response.dart';
import 'package:inabe/src/data/dto/response/living_guide_response.dart';
import 'package:inabe/src/data/dto/response/other_app_response.dart';
import 'package:inabe/src/data/dto/response/top_slider_response.dart';
import 'package:inabe/src/data/dto/response/user_response.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: "http://35.77.55.121/api/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  //Login
  @POST("auth/sign_in")
  Future<HttpResponse<UserResponse>> login(@Body() LoginRequest loginRequest);

  //Sign up
  @POST("auth")
  Future<UserResponse> register(@Body() UserRequest userRequest);

  //logout
  @DELETE("auth/sign_out")
  Future<UserResponse> logout();

  //Forgot password
  @PUT("user/password/reset")
  Future<UserResponse> resetPassword(@Body() ForgotPasswordRequest request);

  @POST("user/password/otp_valid")
  Future<UserResponse> validOTPPassword(@Body() ForgotPasswordRequest request);

  @FormUrlEncoded()
  @POST("user/password/recover")
  Future<UserResponse> recoverPassword(@Field() String email);

  //------End----------

  @POST("user/login_infos/otp_valid")
  Future<UserResponse> validateOTP(@Body() OTPRequest request);

  @POST("user/login_infos/request_otp")
  Future<UserResponse> requestOTP();

  //Setting page
  @PUT("user/basic_infos")
  Future<UserResponse> updateUser(@Body() UpdateUserRequest request);

  @GET("user/basic_infos")
  Future<UserResponse> getUserInfo();

  //Change email or password page
  @PUT("user/login_infos")
  Future<UserResponse> updateLoginInfo(@Body() UpdateUserInfoRequest request);

  @GET("interests")
  Future<InterestResponse> interests();

  @GET("living_guides")
  Future<LivingGuideResponse> livingGuides();

  @GET("other_apps")
  Future<OtherAppResponse> otherApps();

  @GET("electronic_applications")
  Future<ElectronicAppResponse> electronicApps();

  @GET("faqs")
  Future<FAQResponse> faqs();

  @GET("my_mails")
  Future<EmailResponse> getMyEmails(
      @Query("page") int page, @Query("per_page") int perPage);

  @GET("top_slides")
  Future<TopSliderResponse> getTopSlides();

  @GET("news")
  @Header("Content-Type: text/xml")
  Future<String> getNews();
}
