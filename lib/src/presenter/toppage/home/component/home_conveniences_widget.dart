import 'package:aac_core/aac_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/convenience_model.dart';
import 'package:inabe/src/presenter/toppage/home/presenter/home_view_model.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/uri_utils.dart';
import 'package:inabe_design/inabe_design.dart';

class HomeConveniencesWidget
    extends ConsumerViewModelWidget<HomePageViewModel> {
  HomeConveniencesWidget({Key? key}) : super(key: key);
  late BuildContext _context;

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, HomePageViewModel viewModel) {
    _context = context;
    final data = ref.watch(viewModel.conveniences);
    return _buildConveniences(data);
  }

  Padding _buildConveniences(List<ConvenienceModel> data) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.size10, vertical: Dimens.size20),
      child: GridWidget<ConvenienceModel>(
        shrinkWrap: true,
        childAspectRatio: 1.41,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: SizeExtension(10).w,
        mainAxisSpacing: SizeExtension(15).w,
        dataList: data,
        itemBuilder: (index, data) {
          return Container(
            color: data.getConvenienceColor(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: Dimens.size4,
                ),
                Expanded(
                  child: Center(
                    child: data.getConvenienceImage(_context),
                  ),
                ),
                Text(
                  data.name,
                  style: textStyle.large.w700.fill(ColorName.black32),
                ),
                const SizedBox(
                  height: Dimens.size10,
                ),
              ],
            ),
          ).onPressedInkWell(
            () {
              _handleClickConvenience(data);
            },
          ).decor(
            boxDecoration: boxDecoration.round(Dimens.size10),
          );
        },
      ),
    );
  }

  void _handleClickConvenience(ConvenienceModel data) {
    if (data.id == 2 || data.id == 4) {
      UriUtils.launchActionOutside(data: data.path);
    } else {
      _context.go(data.path);
    }
  }

  @override
  AutoDisposeProvider<HomePageViewModel> viewModelProvider() {
    return homePageControllerProvider;
  }
}
