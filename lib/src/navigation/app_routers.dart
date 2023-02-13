import 'package:go_router/go_router.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/change_password/change_password_page.dart';
import 'package:inabe/src/presenter/forgot_password/forgot_password_page.dart';
import 'package:inabe/src/presenter/login/login_page.dart';
import 'package:inabe/src/presenter/register/register_page.dart';
import 'package:inabe/src/presenter/splash/splash_page.dart';
import 'package:inabe/src/presenter/toppage/home/home_page.dart';

class AppGoRouter {
  GoRouter router = GoRouter(
    initialLocation: RouterConstants.splash,
    routes: [
      GoRoute(
        name: "splash",
        path: RouterConstants.splash,
        // builder: (context, state) => const MyHomePage(title: 'Flutter Demo Home Page'),
        builder: (context, state) => const SplashPage(),
        routes: [
          GoRoute(
            name: "top",
            path: RouterConstants.top,
            builder: (context, state) {
              return const HomePage();
            },
            routes: [
              GoRoute(
                name: "top/home",
                path: "${RouterConstants.home}",
                builder: (context, state) {
                  return const HomePage();
                },
              ),
            ],
          ),
          GoRoute(
            name: "settings",
            path: RouterConstants.second,
            builder: (context, state) {
              return const SplashPage();
            },
          ),
          GoRoute(
            name: "home",
            path: RouterConstants.home,
            builder: (context, state) {
              return const HomePage();
            },
          ),
          GoRoute(
            name: RouterConstants.login,
            path: "login",
            builder: (context, state) {
              return const LoginPage();
            },
          ),

          GoRoute(
            name: RouterConstants.register,
            path: "register",
            builder: (context, state) {
              return const RegisterPage();
            },
          ),

          GoRoute(
            name: RouterConstants.forgotPw,
            path: "forgotPw",
            builder: (context, state) {
              return const ForgotPasswordPage();
            },
          ),

          GoRoute(
            name: RouterConstants.changePw,
            path: "changePw",
            builder: (context, state) {
              return const ChangePasswordPage();
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const SplashPage(),
  );
}
