import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

import '../values/my_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function() onTap;

  final Color? color;
  final TextStyle? textStyle;
  final double? height, width;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
    this.textStyle,
    this.height,
    this.width,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.amber,
      onTap: () {
        if (!isLoading) {
          onTap();
        }
      },
      child: Container(
        width: width ?? 90.5.w,
        height: height ?? 6.h,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: color != null
              ? LinearGradient(
                  colors: [color!, color!],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                )
              : const LinearGradient(
                  colors: [
                    MyColors.primary,
                    MyColors.primaryLight,
                    MyColors.primary
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                ),
        ),
        child: Center(
            child: isLoading
                ? SpinKitCircle(
                    color: MyColors.adaptiveInvertedBasic(context),
                    size: 25,
                  )
                : Text(
                    title,
                    style: textStyle ??
                        Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 15.sp,
                            color: Colors.black87,
                            fontFamily: "saudi_riyal"),
                  )),
      ),
    );
  }
}
