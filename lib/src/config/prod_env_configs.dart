

import 'package:inabe/src/config/base_env_configs.dart';

class ProdEnvConfigs implements BaseEnvConfigs {
  @override
  // TODO: implement API_BASE_URL
  String get API_BASE_URL => 'http://35.77.55.121/api/';

  @override
  // TODO: implement BASE_URL_WEBVIEW
  String get BASE_URL_WEBVIEW => 'https://api.novaid.vn';

  @override
  // TODO: implement DOMAIN_LEGACY_URL
  String get DOMAIN_LEGACY_URL => 'https://api.novaid.vn';

  @override
  // TODO: implement DOMAIN_LEGACY_URL_PREFIX
  String get DOMAIN_LEGACY_URL_PREFIX => 'https://api.novaid.vn/api/v2/file/';

  @override
  // TODO: implement DOMAIN_MEDIA
  String get DOMAIN_MEDIA => 'https://api.novaid.vn/media/';

  @override
  // TODO: implement DOMAIN_NVP_STAGE
  String get DOMAIN_NVP_STAGE => 'https://nvp.novaland.com.vn/api/v2/file/';

  @override
  // TODO: implement NID_LOGIN_URL
  String get NID_LOGIN_URL => 'https://www.novaid.vn/login-asc';

  @override
  // TODO: implement ASC_COMMUNITY_API_BASE_URL
  String get ASC_COMMUNITY_API_BASE_URL =>
      'https://aquacity.novaid.vn/app/api';

  @override
  // TODO: implement ASC_OPERATION_API_BASE_URL
  String get ASC_OPERATION_API_BASE_URL =>
      'https://aquacity.novaid.vn/web/api';
}
