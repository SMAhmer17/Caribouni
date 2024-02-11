import '../utils/app_export.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    this.focusNode,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.validator,
    this.isShowIcon = true,
    this.suffixIcon,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.none,
    this.padding = 20,
    this.maxLines,
    this.maxLength,
    this.labelText = '',
    this.prefix,
    this.obscure,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool isShowIcon;
  final Widget? suffixIcon;
  final Widget? prefix;
  final bool enabled;
  final TextCapitalization textCapitalization;
  final double padding;
  final int? maxLines;
  final int? maxLength;
  final String labelText;
  final bool? obscure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: TextFormField(
        autovalidateMode: focusNode != null
            ? focusNode!.hasFocus
                ? AutovalidateMode.always
                : AutovalidateMode.disabled
            : AutovalidateMode.disabled,
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        textCapitalization: textCapitalization,
        enabled: enabled,
        keyboardType: keyboardType,
        controller: controller,
        focusNode: focusNode,
        obscureText: obscure ?? false,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          errorMaxLines: 2,
          contentPadding: EdgeInsets.zero,
          hintText: hintText,
          labelText: labelText.isNotEmpty ? labelText : null,
          labelStyle: AppStyle.txtRobotoRegular16SantaGrey(context),
          prefix: prefix,
          suffixIcon: suffixIcon,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: ColorConstant.darkGold,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: ColorConstant.gainsboro,
            ),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: ColorConstant.gainsboro),
          ),
          errorBorder: InputBorder.none,
        ),
        validator: validator,
      ),
    );
  }
}
