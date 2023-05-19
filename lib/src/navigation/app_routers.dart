import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/src/data/dto/request/forgot_password_request.dart';
import 'package:inabe/src/data/model/email_model.dart';
import 'package:inabe/src/data/model/notification_model.dart';
import 'package:inabe/src/navigation/go_routers_observer.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/convenience_book/convenience_book_page.dart';
import 'package:inabe/src/presenter/electronic_apps/electronic_apps_page.dart';
import 'package:inabe/src/presenter/event/event_page.dart';
import 'package:inabe/src/presenter/faq/faq_page.dart';
import 'package:inabe/src/presenter/forgot_password/forgot_password_page.dart';
import 'package:inabe/src/presenter/forgot_password/forgot_password_success_page.dart';
import 'package:inabe/src/presenter/forgot_password/otp/forgot_password_otp_page.dart';
import 'package:inabe/src/presenter/forgot_password/reset/reset_password_page.dart';
import 'package:inabe/src/presenter/login/login_page.dart';
import 'package:inabe/src/presenter/notification/news_page.dart';
import 'package:inabe/src/presenter/policy/policy_page.dart';
import 'package:inabe/src/presenter/register/register_page.dart';
import 'package:inabe/src/presenter/related_apps/related_apps_page.dart';
import 'package:inabe/src/presenter/setting/setting_page.dart';
import 'package:inabe/src/presenter/splash/splash_page.dart';
import 'package:inabe/src/presenter/toppage/email/detail/email_detail_page.dart';
import 'package:inabe/src/presenter/toppage/email/email_page.dart';
import 'package:inabe/src/presenter/toppage/home/home_page.dart';
import 'package:inabe/src/presenter/toppage/home/presenter/notification_detail/notification_detail_page.dart';
import 'package:inabe/src/presenter/toppage/menu/menu_page.dart';
import 'package:inabe/src/presenter/toppage/top_page.dart';
import 'package:inabe/src/presenter/update_account/otp/update_account_otp_page.dart';
import 'package:inabe/src/presenter/update_account/update_account_page.dart';
import 'package:inabe/src/presenter/webview/webview_page.dart';

class AppGoRouter {
  final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "shell");

  GoRoute webpage = GoRoute(
    parentNavigatorKey: Configs.navigatorKey,
    path: RouterConstants.webpage,
    builder: (context, state) {
      return WebviewPage(url: state.extra! as String);
    },
  );

  GoRoute loginRouter = GoRoute(
      name: RouterConstants.login,
      path: "/${RouterConstants.login}",
      builder: (context, state) {
        return const LoginPage();
      },
      routes: [
        GoRoute(
          name: RouterConstants.forgotPw,
          path: RouterConstants.forgotPw,
          builder: (context, state) {
            return const ForgotPasswordPage();
          },
        ),
        GoRoute(
          name: RouterConstants.forgotPwOTP,
          path: RouterConstants.forgotPwOTP,
          builder: (context, state) {
            return ForgotPasswordOTPPage(email: state.extra as String);
          },
        ),
        GoRoute(
          name: RouterConstants.forgotPwSuccess,
          path: RouterConstants.forgotPwSuccess,
          builder: (context, state) {
            return const ForgotPasswordSuccessPage();
          },
        ),
        GoRoute(
          name: RouterConstants.register,
          path: RouterConstants.register,
          builder: (context, state) {
            return const RegisterPage();
          },
        ),
        GoRoute(
          name: RouterConstants.resetPw,
          path: RouterConstants.resetPw,
          builder: (context, state) {
            return ResetPasswordPage(request: state.extra as ForgotPasswordRequest);
          },
        ),
      ]);

  GoRoute get menuRouter => GoRoute(
          name: RouterConstants.menu,
          path: "/${RouterConstants.menu}",
          builder: (context, state) {
            return const MenuPage();
          },
          routes: [
            GoRoute(
              name: RouterConstants.setting,
              path: RouterConstants.setting,
              builder: (context, state) {
                return const SettingPage();
              },
            ),
            GoRoute(
              name: RouterConstants.faq,
              path: RouterConstants.faq,
              builder: (context, state) {
                return const FAQPage();
              },
            ),
            // webpage,

            GoRoute(
              name: RouterConstants.policy,
              path: RouterConstants.policy,
              builder: (context, state) {
                return const PolicyPage();
              },
            ),
            GoRoute(
              name: RouterConstants.accountOtp,
              path: RouterConstants.accountOtp,
              builder: (context, state) {
                return const UpdateAccountOTPPage();
              },
            ),
            GoRoute(
              name: RouterConstants.updateAccount,
              path: RouterConstants.updateAccount,
              builder: (context, state) {
                return UpdateAccountPage(otp: state.extra! as String);
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
                  webpage,
                  GoRoute(
                    path: RouterConstants.emailDetail,
                    builder: (context, state) {
                      return EmailDetailPage(
                        emailModel: state.extra! as EmailModel,
                      );
                    },
                  ),
                  GoRoute(
                    name: "home/notificationList",
                    path: RouterConstants.newsList,
                    builder: (context, state) {
                      return const NewsPage();
                    },
                    routes: [
                      webpage,
                    ],
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
                      routes: [
                        webpage,
                      ]),
                  GoRoute(
                      name: "home/book",
                      path: RouterConstants.book,
                      builder: (context, state) {
                        return const ConvenienceBookPage();
                      },
                      routes: [webpage]),
                  GoRoute(
                      name: "home/electronic_app",
                      path: RouterConstants.electronic_app,
                      builder: (context, state) {
                        return const ElectronicAppPage();
                      },
                      routes: [webpage]),
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
              routes: [
                GoRoute(
                  name: "email/detail",
                  path: RouterConstants.emailDetail,
                  builder: (context, state) {
                    return EmailDetailPage(
                      emailModel: state.extra! as EmailModel,
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              name: "top/menu",
              path: "/${RouterConstants.menu}",
              pageBuilder: (context, state) {
                return NoTransitionPage(child: MenuPage());
              },
              routes: menuRouter.routes,
            ),
          ]);

  //-----------Main router-------------
  GoRouter get router => GoRouter(
        navigatorKey: Configs.navigatorKey,
        initialLocation: RouterConstants.splash,
        debugLogDiagnostics: true,
        observers: [
          GoRouterObserver(),
        ],
        routes: <RouteBase>[
          GoRoute(
            name: "splash",
            path: RouterConstants.splash,
            // builder: (context, state) => const MyHomePage(title: 'Flutter Demo Home Page'),
            builder: (context, state) => const SplashPage(),
            routes: [
              // GoRoute(
              //   name: "settings",
              //   path: RouterConstants.second,
              //   builder: (context, state) {
              //     return SplashPage();
              //   },
              // ),
              // GoRoute(
              //   name: RouterConstants.register,
              //   path: "register",
              //   builder: (context, state) {
              //     return const RegisterPage();
              //   },
              // ),
              // GoRoute(
              //   name: RouterConstants.changePw,
              //   path: "changePw",
              //   builder: (context, state) {
              //     return const ChangePasswordPage();
              //   },
              // ),
            ],
          ),
          topRouter,
          loginRouter,
        ],
        errorBuilder: (context, state) => const SplashPage(),
      );
}

void launchWebPage(BuildContext context, String from, String? url) {
  context.go("/$from/${RouterConstants.webpage}", extra: url ?? '');
}
