import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/lecture_model.dart';

class LectureInfoSection extends StatelessWidget {
  final LectureModel lecture;

  const LectureInfoSection({
    super.key,
    required this.lecture,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: MyColors.myGrey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: MyColors.skyBlue.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${s.lectureOrder}: ${lecture.lectureOrder}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: MyColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Expanded(
                child: Text(
                  lecture.name,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: MyColors.myBlack,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          if (lecture.description.isNotEmpty) ...[
            12.sbh,
            Text(
              s.lectureDescription,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: MyColors.myBlack,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            6.sbh,
            Text(
              lecture.description,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: MyColors.myGrey,
                    height: 1.5,
                  ),
            ),
          ],
          if (lecture.fullImageUrl != null) ...[
            20.sbh,
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: CachedNetworkImage(
                imageUrl: lecture.fullImageUrl!,
                width: double.infinity,
                height: 160,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const SizedBox.shrink(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
