import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../values/my_colors.dart';


class MyLoadingWidget extends StatelessWidget {
  const MyLoadingWidget({super.key, this.color, this.size});

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: color ?? MyColors.primaryMoreDark,
      size: size ?? 40,
    );
  }
}
