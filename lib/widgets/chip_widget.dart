import '../utils/app_export.dart';

class ChipWidget extends StatefulWidget {
  const ChipWidget({
    super.key,
    required this.label,
    this.color,
  });

  final String label;
  final Color? color;

  @override
  State<ChipWidget> createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  bool enable = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          enable = !enable;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: enable ? Colors.purple.shade50 : Colors.white,
            border: Border.all(
                color: enable ? Colors.purple.shade400 : Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                widget.label,
                maxLines: 2,
                style: AppStyle.txtRobotoRegular16SantaGrey(context).copyWith(
                    color: enable ? Colors.purple.shade400 : Colors.grey),
              ),
            ),
            Image.asset(
              'assets/images/${widget.label}.png',
              color: enable ? Colors.purple.shade500 : Colors.grey,
              scale: 2,
            ),
          ],
        ),
      ),
    );
  }
}
