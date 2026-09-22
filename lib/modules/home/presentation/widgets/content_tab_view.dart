import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'chapter_card.dart';
import 'content_header.dart';

class ContentTabView extends StatelessWidget {
  const ContentTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final s = S.of(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const ContentHeader(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () => cubit.addChapter(s),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.softBlue,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                          ),
                          child: Text(
                            s.addChapter,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: MyColors.primaryDark,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Text(
                          s.chapters,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                color: MyColors.myBlack,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    20.sbh,
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.chapters.length,
                      separatorBuilder: (_, __) => 12.sbh,
                      itemBuilder: (context, index) {
                        final chapter = cubit.chapters[index];
                        return ChapterCard(
                          chapter: chapter,
                          onEdit: () {
                            // Edit chapter callback
                          },
                        );
                      },
                    ),
                    20.sbh,
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
