import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/api_error.dart';
import 'package:inabe/src/data/dto/request/otp_request.dart';
import 'package:inabe/src/data/repository/user/user_repository.dart';
import 'package:inabe/src/presenter/update_account/otp/update_account_otp_ui_state.dart';

final _updateAccountOTPUiStateProvider =
    StateProvider.autoDispose<UpdateAccountOTPUIState>((ref) {
  return UpdateAccountOTPUIState();
});
final updateAccountOTPViewModelProvider =
    Provider.autoDispose<UpdateAccountOTPViewModel>((ref) {
  return UpdateAccountOTPViewModel(
    uiState: ref.watch(_updateAccountOTPUiStateProvider.notifier),
    userRepository: ref.read(userRepositoryProvider),
  );
});

class UpdateAccountOTPViewModel extends ViewModel {
  final UserRepository userRepository;

  AutoDisposeStateProvider<UpdateAccountOTPUIState> get ui =>
      _updateAccountOTPUiStateProvider;

  ProviderListenable<String> get errorMsg =>
      ui.select((value) => value.errorMessage);

  ProviderListenable<bool> get isSuccess =>
      ui.select((value) => value.isSuccess);

  final StateController<UpdateAccountOTPUIState> uiState;

  TextEditingController otpController = TextEditingController();

  UpdateAccountOTPViewModel({
    required this.userRepository,
    required this.uiState,
  }) {
    print("UpdateAccountOTPViewModel constructor");
  }

  @override
  void onInitState() {
    super.onInitState();
  }

  @override
  bool enableBindAppLifeCycle() => true;

  void onChangeOTp() {
    uiState.update((state) => state.copyWith(otp: ''));
  }

  Future<void> validOTP() async {
    bool isError = false;
    String? otp = otpController.text;
    if (otp.isEmpty) {
      isError = true;
      uiState.update((state) => state.copyWith(errorMessage: "Require field"));
    }

    if (isError) {
      return;
    } else {
      final request = OTPRequest(otp: otp ?? '');

      print("ttt resquest = $request\n"
          "json = ${request.toJson()}");
      // return;

      userRepository.validAccountOTP(request).then(
        (value) {
          uiState.update((state) => state.copyWith(isSuccess: true));
        },
      ).catchError((obj) {
        ApiError(obj,
            errorData: (code, msg) => uiState.update(
                (state) => state.copyWith(errorMessage: '$code\n$msg')));
      });
    }
  }
}
