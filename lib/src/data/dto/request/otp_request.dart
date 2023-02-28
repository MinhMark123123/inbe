import 'package:json_annotation/json_annotation.dart';

part 'otp_request.g.dart';

@JsonSerializable()
class OTPRequest {
  String otp;

  OTPRequest({
    required this.otp,
  });

  factory OTPRequest.fromJson(Map<String, dynamic> json) =>
      _$OTPRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OTPRequestToJson(this);
}
