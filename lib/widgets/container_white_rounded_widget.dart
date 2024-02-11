import '../utils/app_export.dart';

class ContainerWhiteRoundedWidget extends StatelessWidget {
  const ContainerWhiteRoundedWidget({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Colors.white,
        ),
        child: child);
  }
}
