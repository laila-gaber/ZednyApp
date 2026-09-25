import 'package:flutter/material.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/chapter_model.dart';
import 'lecture_item_card.dart';

class ChapterExpandableCard extends StatelessWidget {
  final ChapterModel chapter;
  final bool isTeacher;
  final VoidCallback? onAddLecture;

  const ChapterExpandableCard({
    super.key,
    required this.chapter,
    required this.isTeacher,
    this.onAddLecture,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: MyColors.myGrey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: MyColors.transparent),
        child: ExpansionTile(
          initiallyExpanded: true,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          childrenPadding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          iconColor: MyColors.primary,
          collapsedIconColor: MyColors.myGrey,
          title: Text(
            chapter.name,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: MyColors.myBlack,
                  fontWeight: FontWeight.bold,
                ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (chapter.description.isNotEmpty) ...[
                4.sbh,
                Text(
                  chapter.description,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: MyColors.myGrey,
                      ),
                ),
              ],
              6.sbh,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${chapter.lectures.length} ${s.lectures}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: MyColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ],
          ),
          children: [
            if (isTeacher) ...[
              Align(
                alignment: Alignment.centerRight,
                child: OutlinedButton.icon(
                  onPressed: onAddLecture,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: MyColors.primary,
                    side: const BorderSide(color: MyColors.softBlue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                  ),
                  icon: const Icon(Icons.add, size: 18),
                  label: Text(
                    s.addLectureTitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: MyColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              12.sbh,
            ],
            if (chapter.lectures.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  s.noDataYet,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: MyColors.myGrey,
                      ),
                ),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: chapter.lectures.length,
                separatorBuilder: (context, index) => 8.sbh,
                itemBuilder: (context, index) {
                  final lecture = chapter.lectures[index];
                  return LectureItemCard(lecture: lecture);
                },
              ),
          ],
        ),
      ),
    );
  }
}
