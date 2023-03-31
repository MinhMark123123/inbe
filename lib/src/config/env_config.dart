import 'package:inabe/src/config/base_env_configs.dart';
import 'package:inabe/src/config/dev_env_configs.dart';
import 'package:inabe/src/config/prod_env_configs.dart';

class EnvironmentConfig {
  static const String dev = 'dev';
  static const String production = 'production';

  late BaseEnvConfigs configs;
  String environment = dev;
  bool isBuildModule = false;

  factory EnvironmentConfig() {
    return _singleton;
  }

  EnvironmentConfig._internal() {
    initConfig();
  }

  static final EnvironmentConfig _singleton = EnvironmentConfig._internal();

  initConfig({String? environment}) {
    this.environment = environment ?? this.environment;
    configs = _getConfig();
  }

  BaseEnvConfigs _getConfig() {
    switch (environment) {
      case EnvironmentConfig.production:
        return ProdEnvConfigs();
      case EnvironmentConfig.dev:
        return DevEnvConfigs();
      default:
        return DevEnvConfigs();
    }
  }
}
