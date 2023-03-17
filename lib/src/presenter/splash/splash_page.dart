import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/src/data/constants/constants.dart';
import 'package:inabe/src/data/sources/local/key_data_source.dart';
import 'package:inabe/src/navigation/routers.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Future<void> initBuilder;

  @override
  void initState() {
    initBuilder = _initConfigs();
    super.initState();
  }

  Future<void> _initConfigs() async {
    await Future.delayed(Duration.zero);
    await AppConfigs.splashInit(context);
    // callRegisterTask();
    goToHome(context);
    callCheckData();
  }



  Future<void> callCheckData() async {
    var share = KeyDataSource();
    var data = await share.getListCategoryJson();
    print("ttt callCheckData ::: $data");
  }now().day;
  //   int hour = DateTim

  //
  // void callRegisterTask() {
  //   Workmanager().cancelAll();
  //   int day = DateTime.e.now().hour;
  //   DateTime today = DateTime.now();
  //   DateTime triggerD;
  //   int d = DateTime.now().toUtc().millisecondsSinceEpoch;
  //   int trigger;
  //   print("ttt time::: $hour::$d");
  //
  //   if (hour < 23) {
  //     triggerD = today.copyWith(hour: 23, minute: 0, second: 0);
  //     trigger = triggerD.toUtc().millisecondsSinceEpoch;
  //   } else {
  //     triggerD = today.copyWith(day: (day + 1), hour: 23, minute: 0, second: 0);
  //     trigger = triggerD.toUtc().millisecondsSinceEpoch;
  //   }
  //   print("ttt time::: $hour::::${trigger - d}");
  //
  //   // Workmanager().registerPeriodicTask(
  //   //     simpleTaskKey,
  //   //     simpleTaskKey,
  //   //     initialDelay: const Duration(seconds: 30),
  //   //     frequency: const Duration(days: 1)
  //   // );
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initBuilder,
        builder: (context, snapshot) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Assets.images.icLogoBig.image(),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void goToHome(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3000), () async {
      final keyDataSource = KeyDataSource();
      final token = await keyDataSource.getSecure(PrefKeys.keyToken);
      print("ttt token: $token");

      if (mounted) {
        if (token.isEmpty) {
          context.go("/${RouterConstants.login}");
        } else {
          context.go("/${RouterConstants.home}");
        }
      }
      // context.go("/${RouterConstants.home}");
    });
  }
}
