import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/routes/app_routes.dart';
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

    return InkWell(
      onTap: () {
        if (lecture.refNo != null && lecture.refNo!.isNotEmpty) {
          Navigator.pushNamed(
            context,
            AppRoutes.lectureDetails,
            arguments: lecture.refNo,
          );
        }
      },
      borderRadius: BorderRadius.circular(14),
      child: Container(
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
            if (imageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Container(
                    width: 56,
                    height: 56,
                    color: MyColors.skyBlue.withValues(alpha: 0.3),
                    child: const Icon(
                      Icons.movie_outlined,
                      color: MyColors.primary,
                    ),
                  ),
                ),
              )
            else
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: MyColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.play_circle_fill,
                  color: MyColors.primary,
                  size: 28,
                ),
              ),
            12.sbw,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lecture.name,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: MyColors.myBlack,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  if (lecture.description.isNotEmpty) ...[
                    4.sbh,
                    Text(
                      lecture.description,
                      textAlign: TextAlign.start,
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
            12.sbw,
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: MyColors.primary.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: MyColors.primary,
                size: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
