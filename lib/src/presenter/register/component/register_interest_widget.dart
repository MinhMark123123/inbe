import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/interest_model.dart';
import 'package:inabe/src/presenter/register/register_viewmodel.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe_design/dimens.dart';

class RegisterInterestWidget
    extends ConsumerViewModelWidget<RegisterViewModel> {
  const RegisterInterestWidget({Key? key}) : super(key: key);

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, RegisterViewModel viewModel) {
    final async = ref.watch(viewModel.asynCagetory);
    return async.when(data: (data) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: Dimens.size40,
          ),
          Text(
            str.choose_category,
            style: textStyle.medium.w700,
          ),
          const SizedBox(
            height: Dimens.size10,
          ),
          Text(
            str.choose_category_desc,
            style: textStyle.xSmall.w400,
          ),
          ...data.entries.map((entry) {
            return buildChooseCategory(entry, viewModel);
          }).toList(),
          const SizedBox(
            height: Dimens.size20,
          ),
          Text(
            str.choose_category_desc_more,
            style: textStyle.medium.w400,
          ),
          const SizedBox(
            height: Dimens.size40,
          ),
        ],
      );
    }, error: (obj, stackTrace) {
      return Container();
    }, loading: () {
      return Container();
    });
  }

  Widget buildChooseCategory(
      MapEntry<InterestModel, bool> entry, RegisterViewModel viewModel) {
    return Container(
      height: 30,
      margin: const EdgeInsets.only(top: Dimens.size20),
      // color: Colors.yellow,
      child: Row(
        children: [
          SizedBox(
            width: Dimens.size20,
            height: Dimens.size20,
            child: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              side: MaterialStateBorderSide.resolveWith(
                (states) =>
                    const BorderSide(width: 1.0, color: ColorName.boulder),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              checkColor: ColorName.boulder,
              value: entry.value,
              onChanged: (bool? value) {
                print("ttt $value");
                viewModel.selectedCategory(entry.key, value ?? false);
              },
            ),
          ),
          const SizedBox(width: Dimens.size10),
          Text(
            entry.key.name ?? "AAA",
            style: textStyle.medium.w400.fill(ColorName.carbonGrey),
          ),
        ],
      ),
    );
  }

  @override
  AutoDisposeProvider<RegisterViewModel> viewModelProvider() =>
      registerPageControllerProvider;
}
