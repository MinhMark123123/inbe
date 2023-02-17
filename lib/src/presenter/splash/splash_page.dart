import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
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
    print("ttt _initConfigs");
    await Future.delayed(Duration.zero);
    await AppConfigs.splashInit(context);
    goToHome();
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
                  // const Image(
                  //   image: AssetImage('assets/images/ic_logo_big.png'),
                  // ),
                ),
              ),
              // TextButton(
              //   onPressed: () => {
              //     // context.go("/${RouterConstants.login}"),
              //     // context.replace("/${RouterConstants.login}"),
              //   },
              //   child: Text(
              //     "Go S1",
              //     style: textStyle.large.w700.fill(ColorName.boulder),
              //   ),
              // ),
            ],
          ),
        );
      }
    );
  }

void goToHome() {
  Future.delayed(const Duration(milliseconds: 3000), () {
    print("ttt go");
    // context.go("/${RouterConstants.home}");
    context.go("/${RouterConstants.register}");
    // context.go("/${RouterConstants.login}");
  });
}
}
