import 'package:aac_core/src/flavor/env/base_env_configs.dart';

class StagingEnvConfigs implements BaseEnvConfigs {
  @override
  // TODO: implement API_BASE_URL
  String get API_BASE_URL => 'https://api.staging.novaid.vn/graphql';

  @override
  // TODO: implement BASE_URL_WEBVIEW
  String get BASE_URL_WEBVIEW => 'https://legacy.staging.novaid.vn';

  @override
  // TODO: implement DOMAIN_LEGACY_URL
  String get DOMAIN_LEGACY_URL => 'https://legacy.staging.novaid.vn';

  @override
  // TODO: implement DOMAIN_LEGACY_URL_PREFIX
  String get DOMAIN_LEGACY_URL_PREFIX =>
      'https://legacy.staging.novaid.vn/api/v1/file/';

  @override
  // TODO: implement DOMAIN_MEDIA
  String get DOMAIN_MEDIA => 'https://api.staging.novaid.vn/media/';

  @override
  // TODO: implement DOMAIN_NVP_STAGE
  String get DOMAIN_NVP_STAGE =>
      'https://nvpstage.novaland.com.vn/api/v1/file/';

  @override
  // TODO: implement NID_LOGIN_URL
  String get NID_LOGIN_URL => 'https://www.staging.novaid.vn/login-asc';

  @override
  // TODO: implement ASC_COMMUNITY_API_BASE_URL
  String get ASC_COMMUNITY_API_BASE_URL =>
      'https://aquacity.staging.novaid.vn/app/api';

  @override
  // TODO: implement ASC_OPERATION_API_BASE_URL
  String get ASC_OPERATION_API_BASE_URL =>
      'https://aquacity.staging.novaid.vn/web/api';
}
