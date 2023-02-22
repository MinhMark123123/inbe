import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/convenience_model.dart';
import 'package:inabe/src/data/model/notification_model.dart';
import 'package:inabe/src/data/model/slider_model.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/toppage/home/presenter/home_view_model.dart';
import 'package:inabe/src/presenter/toppage/home/presenter/notification_item.dart';
import 'package:inabe/src/presenter/toppage/home/presenter/slider_item.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/uri_utils.dart';
import 'package:inabe/src/utils/utils.dart';
import 'package:inabe_design/inabe_design.dart';

class HomePage extends ConsumerViewModelWidget<HomePageViewModel> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  HomePage({Key? key}) : super(key: key);

  @override
  AutoDisposeProvider<HomePageViewModel> viewModelProvider() =>
      secondScreenControllerProvider;

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, HomePageViewModel viewModel) {
    final electronicApps = ref.watch(viewModel.electronicApps);
    print("widget build size: ${electronicApps.length}");
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
          child: Assets.images.icLogoSmall.image(width: 100, height: 34),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
            child: Assets.images.icLive.image(width: 30),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
            child: Assets.images.icInstagram.image(width: 30),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
            child: Assets.images.icYoutube.image(width: 30),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
            child: Assets.images.icTwitter.image(width: 30),
          ),
        ],
      ),
      // body: buildBody(ref),
      body: buildBodyHome(ref),
    );
  }

  Widget buildBodyHome(WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildTopCarousel(),
          _buildNotification(),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimens.size10, vertical: Dimens.size20),
            child: GridWidget<ConvenienceModel>(
              shrinkWrap: true,
              childAspectRatio: 1.41,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: Dimens.materialMedium,
              mainAxisSpacing: Dimens.size20,
              dataList: conveniences,
              itemBuilder: (index, data) {
                return Container(
                  color: randomColor(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 46,
                        height: 46,
                        color: ColorName.dividerGray,
                      ),
                      const SizedBox(
                        height: Dimens.size10,
                      ),
                      Text(
                        data.name,
                        style: textStyle.large.w700.fill(ColorName.black32),
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
          ),
        ],
      ),
    );
  }

  void _handleClickConvenience(ConvenienceModel data) {
    if (data.id == 2 || data.id == 4) {
      UriUtils.launchActionOutside(data: data.path);
    } else {
      context!.go(data.path);
    }
  }

  Widget buildTopCarousel() {
    return Column(
      children: [
        CarouselSlider(
          items: sliderListDefault.map((e) {
            return SliderHomeItem(sliderModel: e);
          }).toList(),
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: false,
              viewportFraction: 1,
              aspectRatio: 1.75,
              onPageChanged: (index, reason) {
                _current = index;
                //no-op
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: sliderListDefault.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  width: Dimens.size10,
                  height: Dimens.size10,
                  margin: const EdgeInsets.symmetric(
                      vertical: Dimens.mediumPadding, horizontal: 3.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == entry.key
                        ? ColorName.greenB7
                        : const Color(0xFFF5F5F5),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildNotification() {
    return Container(
      color: ColorName.skinF7,
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.size10, vertical: Dimens.size4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNotificationHeader(),
          const SizedBox(
            height: Dimens.size14,
          ),
          _buildListNotification()
        ],
      ),
    );
  }

  ListWidget<NotificationModel> _buildListNotification() {
    return ListWidget<NotificationModel>(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      dividerHeight: Dimens.size10,
      dataList: List.generate(
          3,
          (index) => NotificationModel(
              id: index.toString(),
              date: "14-02-2023",
              title: "I love you three thousand years")),
      itemBuilder: (index, data) {
        return NotificationItem(
          key: Key("${data.id}"),
          notificationModel: data,
          onItemClick: (properties, index) async {
            context!.go(
              "/home/${RouterConstants.notificationDetail}",
              // "${RouterConstants.notificationDetail}",
              extra: data,
            );
          },
        );
      },
    );
  }

  Widget _buildNotificationHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          str.latest_news,
          style: textStyle.large.w700.fill(ColorName.carbonGrey),
        ),
        const Spacer(),
        SizedBox(
          height: Dimens.size20,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: ColorName.greenB7,
            ),
            onPressed: () => {
              context!.go(
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
    );
  }

  Map<UtilityItem, String> getValue() {
    return {
      UtilityItem.EVENT: str.event_information,
      UtilityItem.BOOK: str.convenience_book,
      UtilityItem.MAGAZING: str.magazine_link,
      UtilityItem.ELECTRONIC_APP: str.electronic_app,
      UtilityItem.ELECTRONIC_LIB: str.electronic_library,
      UtilityItem.RELATED_APPS: str.related_apps,
    };
  }

  Map<UtilityItem, Image> getImage() {
    return {
      UtilityItem.EVENT: Assets.images.icEvent.image(),
      UtilityItem.BOOK: Assets.images.icBook.image(),
      UtilityItem.MAGAZING: Assets.images.icMagazine.image(),
      UtilityItem.ELECTRONIC_APP: Assets.images.icElectronicApp.image(),
      UtilityItem.ELECTRONIC_LIB: Assets.images.icElectronicLib.image(),
      UtilityItem.RELATED_APPS: Assets.images.icRelatedApps.image(),
    };
  }
// Map<ConvenienceModel, Image> getImageConvenience() {
//   conveniences.
// }
}
