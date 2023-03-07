import 'package:aac_core/aac_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/src/presenter/register/component/register_action_widget.dart';
import 'package:inabe/src/presenter/register/component/register_form_widget.dart';
import 'package:inabe/src/presenter/register/component/register_interest_widget.dart';
import 'package:inabe/src/presenter/register/component/register_notification_widget.dart';
import 'package:inabe/src/presenter/register/register_viewmodel.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/inabe_design.dart';
import 'package:riverpod/riverpod.dart';

class RegisterPage extends ConsumerViewModelWidget<RegisterViewModel> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, RegisterViewModel viewModel) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        backgroundColor: ColorName.main,
        onBackPressed: () => {context.pop()},
      ),
      body: buildPage(viewModel),
    );
  }

  Widget buildPage(RegisterViewModel viewModel) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.size10),
        child: Column(
          children: const [
            RegisterFormWidget(),
            RegisterInterestWidget(),
            RegisterNotificationWidget(),
            RegisterActionWidget(),
          ],
        ),
      ),
    );
  }

  @override
  AutoDisposeProvider<RegisterViewModel> viewModelProvider() =>
      registerPageControllerProvider;
}
