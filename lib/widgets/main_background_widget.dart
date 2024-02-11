import '../utils/app_export.dart';

class MainBackgroundWidget extends StatelessWidget {
  const MainBackgroundWidget(
      {super.key,
      required this.sizes,
      required this.child,
      this.horizontal = 20});

  final Size sizes;
  final Widget child;
  final double horizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: horizontal),
        height: sizes.height,
        width: sizes.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Group 16436.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: child);
  }
}
