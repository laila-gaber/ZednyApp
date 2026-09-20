import 'package:flutter/material.dart';
import '../values/my_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.isRect,
    this.imagesName,
    this.hint,
    this.enableText,
    this.width,
    this.height,
    this.prefixIcon,
    this.maxLines,
    this.isPhone,
    this.isNumber,
    this.isName,
    this.isEmail,
    this.onChanged,
    this.surfixIcon,
    this.controller,
    this.validatorMethod,
    this.maxDigits,
    this.labelText,
    this.margin,
    this.maxLength,
    this.isPswd,
    this.labelColor,
    this.border, // new bool
  });

  final bool? isRect,
      isPhone,
      isNumber,
      isName,
      isEmail,
      isPswd,
      enableText,
      border; // new

  final String? imagesName, hint, labelText;
  final double? width, height, maxDigits;
  final Widget? prefixIcon, surfixIcon;
  final int? maxLines, maxLength;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  final String? Function(String)? validatorMethod;
  final void Function(String)? onChanged;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    final inputController = controller ?? TextEditingController();
    final mediaQuery = MediaQuery.of(context);
    final locale = Localizations.localeOf(context);

    return Container(
      height: height ?? 56,
      width: width ?? mediaQuery.size.width,
      margin: margin ?? const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      child: TextFormField(
        onChanged: onChanged,
        enabled: enableText ?? true,
        controller: inputController,
        scrollPadding: const EdgeInsets.all(0),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(isRect == true ? 4 : 8),
            borderSide: BorderSide(
              color: border == true
                  ? MyColors.primary
                  : Colors.black12,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(isRect == true ? 4 : 8),
            borderSide: BorderSide(
              color: border == true
                  ? MyColors.primary
                  : Colors.black12,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(isRect == true ? 4 : 8),
            borderSide: BorderSide(
              color: border == true
                  ? MyColors.primary
                  : MyColors.blue,
              width: 1.5,
            ),
          ),
          counter: const Offstage(),
          suffixIcon: surfixIcon,
          prefixIcon: prefixIcon,
          contentPadding: const EdgeInsets.symmetric(vertical: 10.5, horizontal: 12),
          hintText: hint,
          label: labelText == null
              ? null
              : Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(labelText ?? ''),
          ),
          alignLabelWithHint: true,
          labelStyle: TextStyle(
            fontSize: 12,
            color: labelColor ?? Colors.black38,
          ),
          errorStyle: const TextStyle(fontSize: 10),
          hintStyle: const TextStyle(
            height: 1.5,
            color: Color(0xffBBBBCC),
            fontSize: 12,
          ),
        ),
        maxLines: maxLines ?? 1,
        textDirection: (isPhone ?? false) ? TextDirection.ltr : TextDirection.rtl,
        textAlign:
        locale.languageCode == 'ar' ? TextAlign.right : TextAlign.left,
        keyboardType: isEmail == true
            ? TextInputType.emailAddress
            : (isPhone ?? false)
            ? TextInputType.phone
            : (isNumber ?? false)
            ? TextInputType.number
            : TextInputType.text,
        maxLength: maxDigits?.toInt(),
        obscureText: isPswd ?? false,
        validator: validatorMethod != null
            ? (value) => validatorMethod!(value ?? '')
            : (value) => null,
      ),
    );
  }
}
