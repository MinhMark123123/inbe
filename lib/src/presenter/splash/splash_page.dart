import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/src/navigation/routers.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _initConfigs();
    super.initState();
  }

  void _initConfigs() async {
    await AppConfigs.splashInit(context);
  }

  @override
  Widget build(BuildContext context) {
    // goToHome();
    return Scaffold(
      appBar: AppBar(),
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
          TextButton(
            onPressed: () => {
              // context.go("/${RouterConstants.login}"),
              context.replace("/${RouterConstants.login}"),
            },
            child: Text(
              "Go S1",
              style: textStyle.large.w700.fill(ColorName.boulder),
            ),
          ),
        ],
      ),
    );
  }

// void goToHome() {
//   Future.delayed(const Duration(milliseconds: 3000), () {
//     context.push("/${RouterConstants.login}");
//   });
// }
}
