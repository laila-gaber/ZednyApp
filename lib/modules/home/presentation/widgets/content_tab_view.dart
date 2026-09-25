import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'add_chapter_sheet.dart';
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
          spacing: 5,
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
            25.sbh,
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                final isTeacher = cubit.currentUser?.isTeacher ?? false;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      s.chapters,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: MyColors.myBlack,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    if (isTeacher)
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: MyColors.transparent,
                            builder: (_) => AddChapterSheet(cubit: cubit),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: MyColors.softBlue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.add,
                                color: MyColors.primaryDark,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                s.addChapterTitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: MyColors.primaryDark,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                  ],
                );
              },
            ),
            25.sbh,
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
                          Navigator.pushNamed(
                            context,
                            AppRoutes.addLecture,
                            arguments: {
                              'cubit': cubit,
                              'chapterRefNo': chapter.refNo,
                            },
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
