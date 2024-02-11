import '../utils/app_export.dart';

class ProfileGradientWidget extends StatelessWidget {
  const ProfileGradientWidget({
    this.margin = 3,
    this.size = 90,
    super.key,
    required this.imageUrl,
  });
  final double margin;
  final double size;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      padding: const EdgeInsets.all(3),
      decoration: UIhelper.gradientBoxdecoration(),
      child: imageUrl == ""
          ? Icon(
              Icons.person,
              color: Colors.white,
              size: size,
            )
          : Image.network(imageUrl),
    );
  }
}
