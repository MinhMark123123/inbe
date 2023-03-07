import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/notification_model.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/toppage/home/presenter/home_view_model.dart';
import 'package:inabe/src/presenter/toppage/home/presenter/notification_item.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/uri_utils.dart';
import 'package:inabe_design/inabe_design.dart';

class HomeNewsWidget extends ConsumerViewModelWidget<HomePageViewModel> {
  HomeNewsWidget({Key? key}) : super(key: key);
  late BuildContext _context;

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, HomePageViewModel viewModel) {
    _context = context;
    final data = ref.watch(viewModel.notifications);
    return _buildNotification(data);
  }

  Widget _buildNotification(List<NotificationModel> data) {
    return Container(
      color: ColorName.skinF7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNotificationHeader(),
          const Divider(
            height: 1,
            color: ColorName.dividerGray,
          ),
          _buildListNotification(data)
        ],
      ),
    );
  }

  Widget _buildListNotification(List<NotificationModel> data) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.size10),
      child: ListWidget<NotificationModel>(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        dividerHeight: Dimens.size10,
        dataList: data,
        itemBuilder: (index, data) {
          return NotificationItem(
            key: Key("${data.id}"),
            notificationModel: data,
            onItemClick: (data, index) async {
              _context.go(
                RouterConstants.webpageChild(RouterConstants.home),
              extra: data.link,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildNotificationHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: Dimens.size12, horizontal: Dimens.size10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            str.latest_news,
            style: textStyle.large.w700.fill(ColorName.greenSnake),
          ),
          const Spacer(),
          SizedBox(
            height: Dimens.materialLarge,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: ColorName.greenSnake,
              ),
              onPressed: () => {
                _context.go(
                  "/home/${RouterConstants.notificationList}",
                )
              },
              child: Text(
                str.see_more,
                style: textStyle.xSmall.w700.fill(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  AutoDisposeProvider<HomePageViewModel> viewModelProvider() {
    return homePageControllerProvider;
  }
}