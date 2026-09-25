import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'add_chapter_sheet.dart';
import 'add_lecture_sheet.dart';
import 'chapter_expandable_card.dart';
import 'home_header_widget.dart';

class ContentTabView extends StatelessWidget {
  const ContentTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final s = S.of(context);

    // Initial fetch
    if (cubit.chapters.isEmpty && cubit.state is HomeInitial) {
      cubit.initData(s);
    }

    return RefreshIndicator(
      onRefresh: () async {
        await cubit.fetchProfile(s);
        await cubit.fetchChaptersByGrade(s: s);
      },
      color: MyColors.primary,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return HomeHeaderWidget(
                  currentUser: cubit.currentUser,
                  selectedGrade: cubit.selectedGrade,
                  onGradeSelected: (grade) => cubit.changeGrade(grade, s),
                );
              },
            ),
            20.sbh,
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                final isTeacher = cubit.currentUser?.isTeacher ?? false;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (isTeacher)
                      ElevatedButton.icon(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: MyColors.transparent,
                            builder: (_) => AddChapterSheet(cubit: cubit),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.softBlue,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                        ),
                        icon: const Icon(
                          Icons.add,
                          color: MyColors.primaryDark,
                          size: 18,
                        ),
                        label: Text(
                          s.addChapterTitle,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                color: MyColors.primaryDark,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                    Text(
                      s.chapters,
                      style:
                          Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: MyColors.myBlack,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ],
                );
              },
            ),
            16.sbh,
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: MyColors.primary,
                      ),
                    ),
                  );
                }

                if (cubit.chapters.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.folder_open_outlined,
                          size: 56,
                          color: MyColors.myGrey,
                        ),
                        12.sbh,
                        Text(
                          s.noChaptersFound,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                color: MyColors.myGrey,
                              ),
                        ),
                      ],
                    ),
                  );
                }

                final isTeacher = cubit.currentUser?.isTeacher ?? false;

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cubit.chapters.length,
                  separatorBuilder: (context, index) => 14.sbh,
                  itemBuilder: (context, index) {
                    final chapter = cubit.chapters[index];
                    return ChapterExpandableCard(
                      chapter: chapter,
                      isTeacher: isTeacher,
                      onAddLecture: () {
                        if (chapter.refNo != null) {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: MyColors.transparent,
                            builder: (_) => AddLectureSheet(
                              cubit: cubit,
                              chapterRefNo: chapter.refNo!,
                            ),
                          );
                        }
                      },
                    );
                  },
                );
              },
            ),
            24.sbh,
          ],
        ),
      ),
    );
  }
}
