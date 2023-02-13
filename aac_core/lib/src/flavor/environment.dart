import 'package:aac_core/src/flavor/env/base_env_configs.dart';
import 'package:aac_core/src/flavor/env/prod_env_configs.dart';
import 'package:aac_core/src/flavor/env/stg_env_configs.dart';
import 'package:aac_core/src/flavor/env/uat_env_configs.dart';

class AppEnvironment {
  static const String development = 'development';
  static const String staging = 'staging';
  static const String uat = 'uat';
  static const String preprd = 'preprd';
  static const String production = 'production';

  late BaseEnvConfigs configs;
  String environment = staging;
  bool isBuildModule = false;

  factory AppEnvironment() {
    return _singleton;
  }

  AppEnvironment._internal() {
    initConfig();
  }

  static final AppEnvironment _singleton = AppEnvironment._internal();

  initConfig({String? environment, bool? isBuildModule = false}) {
    this.environment = environment ?? this.environment;
    this.isBuildModule = isBuildModule ?? this.isBuildModule;
    configs = _getConfig();
  }

  BaseEnvConfigs _getConfig() {
    switch (environment) {
      case AppEnvironment.production:
        return ProdEnvConfigs();
      case AppEnvironment.preprd:
      case AppEnvironment.uat:
        return UATEnvConfigs();
      default:
        return StagingEnvConfigs();
    }
  }
}
