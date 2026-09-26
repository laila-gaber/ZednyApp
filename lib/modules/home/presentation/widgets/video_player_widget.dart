import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController? controller;
  final bool isInitialized;
  final bool isPlaying;
  final VoidCallback onPlayPauseTap;
  final String? imageUrl;

  const VideoPlayerWidget({
    super.key,
    required this.controller,
    required this.isInitialized,
    required this.isPlaying,
    required this.onPlayPauseTap,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        color: MyColors.primaryDark,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: MyColors.myGrey.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: isInitialized && controller != null
            ? Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: controller!.value.aspectRatio,
                    child: VideoPlayer(controller!),
                  ),
                  GestureDetector(
                    onTap: onPlayPauseTap,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: MyColors.primaryDark.withValues(alpha: 0.6),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isPlaying
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        color: MyColors.white,
                        size: 36,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: VideoProgressIndicator(
                      controller!,
                      allowScrubbing: true,
                      colors: const VideoProgressColors(
                        playedColor: MyColors.softBlue,
                        bufferedColor: MyColors.myGrey,
                        backgroundColor: MyColors.darkCard,
                      ),
                    ),
                  ),
                ],
              )
            : _buildFallback(context, s),
      ),
    );
  }

  Widget _buildFallback(BuildContext context, S s) {
    final hasImage = imageUrl != null && imageUrl!.trim().isNotEmpty;

    if (hasImage) {
      final sanitizedUrl = imageUrl!.replaceAll("thumb-", "");
      return Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: sanitizedUrl,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: MyColors.primaryDark,
              child: const Center(
                child: CircularProgressIndicator(
                  color: MyColors.primary,
                ),
              ),
            ),
            errorWidget: (context, url, error) => _buildPlaceholder(context, s),
          ),
          GestureDetector(
            onTap: onPlayPauseTap,
            child: Container(
              color: Colors.black54,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: MyColors.primaryDark.withValues(alpha: 0.6),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: MyColors.white,
                    size: 36,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return _buildPlaceholder(context, s);
  }

  Widget _buildPlaceholder(BuildContext context, S s) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.ondemand_video_outlined,
            size: 48,
            color: MyColors.softBlue,
          ),
          const SizedBox(height: 8),
          Text(
            s.videoNotAvailable,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: MyColors.descriptionColor,
                ),
          ),
        ],
      ),
    );
  }
}
