import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/src/data/constants/constants.dart';
import 'package:inabe/src/data/sources/local/key_data_source.dart';
import 'package:inabe/src/navigation/routers.dart';

// class SplashPage extends ConsumerViewModelWidget<SplashViewModel> {
//   SplashPage({Key? key}) : super(key: key);
//
//   late Future<void> initBuilder;
//
//   @override
//   void aWake(WidgetRef ref, SplashViewModel viewModel) {
//     initBuilder = _initConfigs(viewModel);
//     super.aWake(ref, viewModel);
//   }
//
//   @override
//   Widget buildWidget(BuildContext context, WidgetRef ref, SplashViewModel viewModel) {
//     return FutureBuilder(
//         future: initBuilder,
//         builder: (context, snapshot) {
//           return Scaffold(
//             body: Column(
//               children: [
//                 Expanded(
//                   child: Container(
//                     color: Colors.white,
//                     child: Assets.images.icLogoBig.image(),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//   }
//
//
//
//   Future<void> _initConfigs(SplashViewModel viewModel) async {
//     await Future.delayed(Duration.zero);
//     await AppConfigs.splashInit(context!);
//     goToHome(viewModel);
//   }
//
//   void goToHome(SplashViewModel viewModel) {
//     Future.delayed(const Duration(milliseconds: 3000), () {
//       // context.go("/${RouterConstants.home}");
//       if(viewModel.isLoggedIn()) {
//         context?.go("/${RouterConstants.home}");
//       } else {
//         context?.go("/${RouterConstants.login}");
//       }
//     });
//   }
//
//   @override
//   AutoDisposeProvider<SplashViewModel> viewModelProvider() {
//     return splashViewModelProvider;
//   }
// }

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
                  ),
                ),
              ],
            ),
          );
        });
  }

  void goToHome() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      // context.go("/${RouterConstants.home}");
      final keyDataSource = KeyDataSource();
      final token = keyDataSource.get(PrefKeys.keyToken);

      // if(token.isEmpty) {
      //   context.go("/${RouterConstants.login}");
      // } else {
      //   context.go("/${RouterConstants.home}");
      // }
      context.go("/${RouterConstants.home}");
    });
  }
}
