import '../utils/app_export.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final Color errorIconColor;
  const ImageWidget({
    required this.imageUrl,
    super.key,
    this.errorIconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return const Center(
          child: SizedBox(child: CircularProgressIndicator()),
        );
      },
      errorBuilder: (context, error, stackTrace) => Icon(
        Icons.image_outlined,
        color: errorIconColor,
        size: 40,
      ),
    );
  }
}
