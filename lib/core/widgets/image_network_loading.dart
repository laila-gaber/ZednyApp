import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../values/my_colors.dart';

class ImageNetworkLoading extends StatelessWidget {
  final String? image;
  final double? height;
  final double? width;

  const ImageNetworkLoading({super.key, this.image, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: image!,
      fit: BoxFit.fill,
      cacheManager: VersionAwareCacheManager(),
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator(color: MyColors.blue)),
      errorWidget: (context, url, error) => const Icon(Icons.error_outline_rounded),
    );
  }
}

class VersionAwareCacheManager extends CacheManager {
  static final VersionAwareCacheManager _instance = VersionAwareCacheManager._();
  factory VersionAwareCacheManager() => _instance;
  VersionAwareCacheManager._()
      : super(
          Config(
            "versionAwareCache",
            maxNrOfCacheObjects: 1,
            fileService: HttpFileService(),
          ),
        );
}
