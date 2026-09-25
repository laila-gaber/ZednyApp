import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../data/models/lecture_model.dart';

class LectureItemCard extends StatelessWidget {
  final LectureModel lecture;

  const LectureItemCard({
    super.key,
    required this.lecture,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = lecture.fullImageUrl;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: MyColors.offWhite,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: MyColors.inputBorder.withValues(alpha: 0.6),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: MyColors.primary.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_arrow_rounded,
              color: MyColors.primary,
              size: 22,
            ),
          ),
          12.sbw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  lecture.name,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: MyColors.myBlack,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                if (lecture.description.isNotEmpty) ...[
                  4.sbh,
                  Text(
                    lecture.description,
                    textAlign: TextAlign.end,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: MyColors.myGrey,
                        ),
                  ),
                ],
              ],
            ),
          ),
          if (imageUrl != null) ...[
            12.sbw,
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) => Container(
                  width: 56,
                  height: 56,
                  color: MyColors.skyBlue.withValues(alpha: 0.3),
                  child: const Icon(
                    Icons.movie_outlined,
                    color: MyColors.primary,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
