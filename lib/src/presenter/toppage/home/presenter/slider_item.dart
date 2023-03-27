import 'package:inabe/src/data/model/top_slider_model.dart';
import 'package:inabe/src/utils/extensions/context_extesion.dart';
import 'package:inabe/src/utils/uri_utils.dart';
import 'package:inabe_design/inabe_design.dart';

class SliderHomeItem extends StatelessWidget {
  const SliderHomeItem({
    Key? key,
    required this.sliderModel,
  }) : super(key: key);

  final TopSliderModel sliderModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: SizedBox(
        width: context.screenWidth,
        child: Stack(
          children: <Widget>[
            ImageViewWidget(
              sliderModel.src ?? '',
              width: context.screenWidth,
              height: (context.screenWidth * 9 / 16),
              fit: BoxFit.cover,
              alignment: Alignment.center,
              onTapImage: (context, tag, image) {
                UriUtils.launchActionOutside(data: sliderModel.href);
                // HeroImageController.showGallery(
                //   context,
                //   image,
                //   tag,
                //   index,
                //   widget.images
                //       .map((e) => UriUtils.getASCImagePath(e))
                //       .toList(),
                // );
              },
            ),
            // Image.network(item, fit: BoxFit.cover, width: 1000.0),
            // Positioned(
            //   bottom: 0.0,
            //   left: 0.0,
            //   right: 0.0,
            //   child: Container(
            //     decoration: const BoxDecoration(
            //       gradient: LinearGradient(
            //         colors: [
            //           Color.fromARGB(200, 0, 0, 0),
            //           Color.fromARGB(0, 0, 0, 0)
            //         ],
            //         begin: Alignment.bottomCenter,
            //         end: Alignment.topCenter,
            //       ),
            //     ),
            //     padding: const EdgeInsets.symmetric(
            //         vertical: Dimens.size10, horizontal: Dimens.size20),
            //     child: Text(
            //       '${sliderModel.alt}',
            //       style: textStyle.x5Large.w700.fill(Colors.white),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
