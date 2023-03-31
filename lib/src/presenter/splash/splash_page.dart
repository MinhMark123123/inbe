import 'package:aac_core/aac_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/src/config/env_config.dart';
import 'package:inabe/src/data/constants/constants.dart';
import 'package:inabe/src/data/sources/local/key_data_source.dart';
import 'package:inabe/src/navigation/routers.dart';

import '../../domain/notification_task/push_notification.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Future<void> initBuilder;

  bool _visible = false;

  @override
  void initState() {
    initBuilder = _initConfigs();
    super.initState();
  }

  Future<void> _initConfigs() async {
    await Future.delayed(Duration.zero);
    EnvironmentConfig().initConfig(environment: EnvironmentConfig.dev);
    setState(() {
      _visible = true;
    });
    _goToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initBuilder,
        builder: (context, snapshot) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.4,
                    duration: const Duration(seconds: 2),
                    child: Container(
                      color: Colors.white,
                      child: Assets.images.icLogoBig.image(),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }


  void _goToHome(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3000), () async {
      final keyDataSource = KeyDataSource();
      final token = await keyDataSource.getSecure(PrefKeys.keyToken);

      if (mounted) {
        if (token.isEmpty) {
          context.go("/${RouterConstants.login}");
        } else {
          context.go("/${RouterConstants.home}");
        }
      }
    });
  }
}
