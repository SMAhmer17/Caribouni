import '../utils/app_export.dart';

class CircleContainerWithIconWidget extends StatelessWidget {
  const CircleContainerWithIconWidget({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorConstant.gainsboro,
      ),
      child: child,
    );
  }
}
