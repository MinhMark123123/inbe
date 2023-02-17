import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/data/model/slider_model.dart';
import 'package:inabe_design/inabe_design.dart';

class SliderHomeItem extends StatelessWidget {
  const SliderHomeItem({
    Key? key,
    required this.sliderModel,
  }) : super(key: key);

  final SliderModel sliderModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: SizedBox(
        width: Configs.screenWidth,
        child: Stack(
          children: <Widget>[
            ImageViewWidget(
              sliderModel.link,
              width: Configs.screenWidth,
              height: (Configs.screenWidth * 9 / 16),
              fit: BoxFit.cover,
              alignment: Alignment.center,
              onTapImage: (context, tag, image) {
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
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: Dimens.size10, horizontal: Dimens.size20),
                child: Text(
                  'No ${sliderModel.id}: ${sliderModel.name}',
                  style: textStyle.x5Large.w700.fill(Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
