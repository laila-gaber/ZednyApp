import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zedny_app/core/values/my_colors.dart';

class CachedImgWidget extends StatelessWidget {
  const CachedImgWidget(
      {super.key,
      required this.imageUrl,
      this.width,
      this.height,
      this.fit,
      this.withThumb,
      this.errorSize});

  final String imageUrl;
  final double? width;
  final double? height;
  final double? errorSize;
  final BoxFit? fit;
  final bool? withThumb;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width ?? 60,
      height: height ?? 60,
      fit: fit ?? BoxFit.cover,
      imageUrl:
          (withThumb ?? true) ? imageUrl : imageUrl.replaceAll("thumb-", ""),
      placeholder: (context, url) => SpinKitPulse(
        color: MyColors.primaryMoreDark,
      ),
      errorWidget: (context, url, error) => Center(
        child: Icon(
          Icons.image,
          size: errorSize ?? (width ?? 30),
          color: MyColors.myGrey,
        ),
      ),
      errorListener: (o)
      {
      },
    );
  }
}
