import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../cubit/student_cubit.dart';
import '../cubit/student_state.dart';
import '../widgets/student_header_widget.dart';
import '../widgets/student_item_card.dart';
import '../widgets/student_search_bar.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<StudentCubit>();
    final s = S.of(context);

    // Initial fetch when screen opens
    if (cubit.allStudents.isEmpty && cubit.state is StudentInitial) {
      cubit.fetchStudents(s: s);
    }

    return Scaffold(
      backgroundColor: MyColors.offWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            children: [
              BlocBuilder<StudentCubit, StudentState>(
                builder: (context, state) {
                  return StudentHeaderWidget(
                    totalCount: cubit.filteredStudents.length,
                  );
                },
              ),
              16.sbh,
              StudentSearchBar(
                controller: cubit.searchController,
                onChanged: (query) => cubit.searchStudents(query),
              ),
              16.sbh,
              Expanded(
                child: BlocBuilder<StudentCubit, StudentState>(
                  builder: (context, state) {
                    if (state is StudentLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: MyColors.primary,
                        ),
                      );
                    } else if (state is StudentFailure) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              size: 48,
                              color: MyColors.red,
                            ),
                            12.sbh,
                            Text(
                              state.message,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: MyColors.myBlack,
                                  ),
                            ),
                            16.sbh,
                            ElevatedButton(
                              onPressed: () => cubit.fetchStudents(s: s),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                s.retry,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: MyColors.white,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    if (cubit.filteredStudents.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.search_off,
                              size: 56,
                              color: MyColors.myGrey,
                            ),
                            12.sbh,
                            Text(
                              s.noStudentsFound,
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

                    return ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: cubit.filteredStudents.length,
                      separatorBuilder: (context, index) => 12.sbh,
                      itemBuilder: (context, index) {
                        final student = cubit.filteredStudents[index];
                        return StudentItemCard(student: student);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
