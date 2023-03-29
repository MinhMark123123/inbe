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
