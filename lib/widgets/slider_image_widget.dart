// ignore_for_file: prefer_const_constructors

import '../utils/app_export.dart';

class SliderImageWidget extends StatelessWidget {
  final String imagePath;
  final double topLeftRound;
  final double bottomLeftRound;
  final double topRightRound;
  final double bottomRightRound;

  const SliderImageWidget({
    super.key,
    required this.imagePath,
    this.topLeftRound = 0,
    this.bottomLeftRound = 30,
    this.topRightRound = 0,
    this.bottomRightRound = 30,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(bottomLeftRound),
          bottomRight: Radius.circular(bottomRightRound),
          topLeft: Radius.circular(topLeftRound),
          topRight: Radius.circular(topRightRound)),
      child: SizedBox(
        width: double.infinity,
        child: Image.network(imagePath, fit: BoxFit.cover, loadingBuilder:
            (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }, errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Icon(
            Icons.image_outlined,
            color: ColorConstant.gainsboro,
            size: 50.00,
          );
        }),
      ),
    );
  }
}
