import 'package:flutter/material.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../cubit/home_cubit.dart';

class AddChapterSheet extends StatelessWidget {
  final HomeCubit cubit;

  const AddChapterSheet({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(28),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: MyColors.myGrey.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            16.sbh,
            Text(
              s.addChapterTitle,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: MyColors.myBlack,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            20.sbh,
            Text(
              s.chapterName,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: MyColors.myBlack,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            8.sbh,
            TextField(
              controller: cubit.chapterNameController,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                filled: true,
                fillColor: MyColors.offWhite,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: MyColors.inputBorder),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: MyColors.inputBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: MyColors.primary),
                ),
              ),
            ),
            16.sbh,
            Text(
              s.chapterDescription,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: MyColors.myBlack,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            8.sbh,
            TextField(
              controller: cubit.chapterDescController,
              maxLines: 3,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                filled: true,
                fillColor: MyColors.offWhite,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: MyColors.inputBorder),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: MyColors.inputBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: MyColors.primary),
                ),
              ),
            ),
            24.sbh,
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  cubit.submitSaveChapter(s);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  s.save,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: MyColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
