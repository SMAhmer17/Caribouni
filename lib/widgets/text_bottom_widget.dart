// ignore_for_file: prefer_const_constructors

import '../utils/app_export.dart';

class TextBottomWidget extends StatelessWidget {
  const TextBottomWidget({
    Key? key,
    this.iconAudio,
    this.iconSendMessage,
    this.iconSticker,
    this.radius = 50.0,
    required this.controller,
    this.onChanged,
    this.onPressedSend,
    this.isSending = false,
  }) : super(key: key);
  final Widget? iconAudio;
  final Widget? iconSendMessage;
  final Widget? iconSticker;
  final TextEditingController controller;
  final Function(String?)? onChanged;
  final void Function()? onPressedSend;
  final bool isSending;

  final double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
          color: Colors.white,
          shape: BoxShape.rectangle),
      child: Padding(
        padding: EdgeInsets.only(
          right: 5,
          left: 15,
        ),
        child: Row(
          children: [
            Flexible(
                child: TextFormField(
              controller: controller,
              style: AppStyle.txtRobotoRegular16SantaGrey(context),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0),
                hintStyle: AppStyle.txtRobotoRegular16SantaGrey(context),
                hintText: TextValue.messageHint,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            )),
            isSending
                ? Center(
                    child: Padding(
                    padding: EdgeInsets.only(
                      right: 15,
                    ),
                    child: SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                    ),
                  ))
                : Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              ColorConstant.darkViolet,
                              ColorConstant.cadmiumOrange
                            ])),
                    child: Transform.rotate(
                        angle: 175,
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ))),
          ],
        ),
      ),
    );
  }
}
