import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/presenter/login/component/login_action_widget.dart';
import 'package:inabe/src/presenter/login/component/login_input_form.dart';
import 'package:inabe/src/presenter/login/login_view_model.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe_design/inabe_design.dart';

class LoginPage extends ConsumerViewModelWidget<LoginViewModel> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  AutoDisposeProvider<LoginViewModel> viewModelProvider() {
    return loginPageControllerProvider;
  }

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, LoginViewModel viewModel) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.size10),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100, bottom: 40),
                  child: Assets.images.icLogoBig.image(width: 160)),
              const LoginInputFormWidget(),
              const LoginActionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
