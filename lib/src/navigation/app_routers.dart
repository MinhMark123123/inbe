import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/src/data/model/notification_model.dart';
import 'package:inabe/src/navigation/go_routers_observer.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/change_password/change_password_page.dart';
import 'package:inabe/src/presenter/convenience_book/convenience_book_page.dart';
import 'package:inabe/src/presenter/electronic_apps/electronic_apps_page.dart';
import 'package:inabe/src/presenter/event/event_page.dart';
import 'package:inabe/src/presenter/forgot_password/forgot_password_page.dart';
import 'package:inabe/src/presenter/forgot_password/notify_forgot_password_success.dart';
import 'package:inabe/src/presenter/login/login_page.dart';
import 'package:inabe/src/presenter/notification/notification_list_page.dart';
import 'package:inabe/src/presenter/register/register_page.dart';
import 'package:inabe/src/presenter/related_apps/related_apps_page.dart';
import 'package:inabe/src/presenter/splash/splash_page.dart';
import 'package:inabe/src/presenter/toppage/email/email_page.dart';
import 'package:inabe/src/presenter/toppage/home/home_page.dart';
import 'package:inabe/src/presenter/toppage/home/presenter/notification_detail/notification_detail_page.dart';
import 'package:inabe/src/presenter/toppage/medicine/medicine_page.dart';
import 'package:inabe/src/presenter/toppage/menu/menu_page.dart';
import 'package:inabe/src/presenter/toppage/menu/setting_page.dart';
import 'package:inabe/src/presenter/toppage/top_page.dart';

class AppGoRouter {
  final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "shell");
  GoRoute loginRouter = GoRoute(
      name: RouterConstants.login,
      path: "/${RouterConstants.login}",
      builder: (context, state) {
        return const LoginPage();
      },
      routes: [
        GoRoute(
          name: RouterConstants.forgotPw,
          path: "forgotPw",
          builder: (context, state) {
            return const ForgotPasswordPage();
          },
        ),
        GoRoute(
          name: RouterConstants.forgotPwSuccess,
          path: RouterConstants.forgotPwSuccess,
          builder: (context, state) {
            return const NotifyForgotPasswordSuccess();
          },
        ),
      ]);

  GoRoute menuRouter = GoRoute(
      name: RouterConstants.menu,
      path: "/${RouterConstants.menu}",
      builder: (context, state) {
        return MenuPage(
          isLogin: false,
        );
      },
      routes: [
        GoRoute(
          name: RouterConstants.setting,
          path: RouterConstants.setting,
          builder: (context, state) {
            return const SettingPage();
          },
        ),
      ]);

  ShellRoute get topRouter => ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => TopPage(
                key: state.pageKey,
                child: child,
              ),
          routes: [
            GoRoute(
                name: "top/home",
                path: "/${RouterConstants.home}",
                pageBuilder: (context, state) {
                  return NoTransitionPage(child: HomePage());
                },
                routes: [
                  GoRoute(
                    name: "home/notificationList",
                    path: RouterConstants.notificationList,
                    builder: (context, state) {
                      return const NotificationListPage();
                    },
                  ),
                  GoRoute(
                    name: "home/detail",
                    path: RouterConstants.notificationDetail,
                    builder: (context, state) {
                      return NotificationDetailPage(
                        notificationModel: state.extra! as NotificationModel,
                      );
                    },
                  ),
                  GoRoute(
                    name: "home/event",
                    path: RouterConstants.event,
                    builder: (context, state) {
                      return const EventPage();
                    },
                  ),
                  GoRoute(
                    name: "home/book",
                    path: RouterConstants.book,
                    builder: (context, state) {
                      return const ConvenienceBookPage();
                    },
                  ),
                  // GoRoute(
                  //   name: "home/magazine",
                  //   path: RouterConstants.magazine,
                  //   builder: (context, state) {
                  //     return const MagazineLinkPage();
                  //   },
                  // ),
                  GoRoute(
                    name: "home/electronic_app",
                    path: RouterConstants.electronic_app,
                    builder: (context, state) {
                      return const ElectronicAppPage();
                    },
                  ),
                  // GoRoute(
                  //   name: "home/electronic_lib",
                  //   path: RouterConstants.electronic_lib,
                  //   builder: (context, state) {
                  //     return NotificationDetailPage(
                  //       notificationModel: state.extra! as NotificationModel,
                  //     );
                  //   },
                  // ),
                  GoRoute(
                    name: "home/related_apps",
                    path: RouterConstants.related_apps,
                    builder: (context, state) {
                      return const RelatedAppPage();
                    },
                  ),
                ]),
            GoRoute(
              name: "top/email",
              path: "/${RouterConstants.email}",
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: EmailPage());
              },
            ),
            GoRoute(
              name: "top/medicine",
              path: "/${RouterConstants.medicine}",
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: MedicinePage());
              },
            ),
            GoRoute(
              name: "top/menu",
              path: "/${RouterConstants.menu}",
              pageBuilder: (context, state) {
                return NoTransitionPage(
                    child: MenuPage(
                  isLogin: false,
                ));
              },
            ),
          ]);

  //-----------Main router-------------
  GoRouter get router => GoRouter(
        navigatorKey: Configs.navigatorKey,
        initialLocation: RouterConstants.splash,
        // initialLocation: "/${RouterConstants.home}",
        observers: [
          GoRouterObserver(),
        ],
        routes: <RouteBase>[
          GoRoute(
            name: "splash",
            path: RouterConstants.splash,
            // builder: (context, state) => const MyHomePage(title: 'Flutter Demo Home Page'),
            builder: (context, state) => SplashPage(),
            routes: [
              GoRoute(
                name: "settings",
                path: RouterConstants.second,
                builder: (context, state) {
                  return SplashPage();
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
                name: RouterConstants.changePw,
                path: "changePw",
                builder: (context, state) {
                  return const ChangePasswordPage();
                },
              ),
            ],
          ),
          topRouter,
          loginRouter,
          menuRouter,
          // GoRoute(
          //   name: "top",
          //   path: "/${RouterConstants.top}",
          //   builder: (context, state) {
          //     return const TopPage();
          //   },
          //   routes: [
          //     GoRoute(
          //       name: "top/home",
          //       path: RouterConstants.home,
          //       builder: (context, state) {
          //         return const HomePage();
          //       },
          //     ),
          //   ],
          // ),
        ],
        errorBuilder: (context, state) => SplashPage(),
      );
}
