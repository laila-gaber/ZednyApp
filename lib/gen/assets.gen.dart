// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// Directory path: assets/fonts/schehrazad
  $AssetsFontsSchehrazadGen get schehrazad => const $AssetsFontsSchehrazadGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Quranic_verse.png
  AssetGenImage get quranicVerse =>
      const AssetGenImage('assets/images/Quranic_verse.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/logoImg.png
  AssetGenImage get logoImg => const AssetGenImage('assets/images/logoImg.png');

  /// List of all assets
  List<AssetGenImage> get values => [quranicVerse, logo, logoImg];
}

class $AssetsFontsSchehrazadGen {
  const $AssetsFontsSchehrazadGen();

  /// File path: assets/fonts/schehrazad/ScheherazadeNew-Bold.ttf
  String get scheherazadeNewBold =>
      'assets/fonts/schehrazad/ScheherazadeNew-Bold.ttf';

  /// File path: assets/fonts/schehrazad/ScheherazadeNew-Medium.ttf
  String get scheherazadeNewMedium =>
      'assets/fonts/schehrazad/ScheherazadeNew-Medium.ttf';

  /// File path: assets/fonts/schehrazad/ScheherazadeNew-Regular.ttf
  String get scheherazadeNewRegular =>
      'assets/fonts/schehrazad/ScheherazadeNew-Regular.ttf';

  /// List of all assets
  List<String> get values => [
    scheherazadeNewBold,
    scheherazadeNewMedium,
    scheherazadeNewRegular,
  ];
}

abstract final class Assets {
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
