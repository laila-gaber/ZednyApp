import 'package:flutter/material.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/chapter_model.dart';

class ChapterCard extends StatelessWidget {
  final ChapterModel chapter;
  final VoidCallback? onEdit;

  const ChapterCard({
    super.key,
    required this.chapter,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: MyColors.myGrey.withValues(alpha: 0.15),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: chapter.accentColor,
                width: 4,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: onEdit,
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.chevron_left,
                        size: 20,
                        color: MyColors.myGrey,
                      ),
                      4.sbw,
                      Text(
                        s.edit,
                        style:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: MyColors.myGrey,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      chapter.title,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: MyColors.myBlack,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    4.sbh,
                    Text(
                      '${chapter.lecturesCount} ${s.lectures} · ${chapter.grade}',
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: MyColors.myGrey,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
