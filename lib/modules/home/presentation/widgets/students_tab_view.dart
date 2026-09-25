import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'student_card.dart';
import 'students_header.dart';

class StudentsTabView extends StatelessWidget {
  const StudentsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final s = S.of(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const StudentsHeader(),
/*
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Column(
                  children: [
                    TextField(
                      controller: cubit.searchStudentController,
                      onChanged: (value) => cubit.searchStudents(value),
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: MyColors.myBlack,
                          ),
                      decoration: InputDecoration(
                        hintText: s.searchStudent,
                        hintStyle:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: MyColors.myGrey,
                                ),
                        suffixIcon: const Icon(
                          Icons.search,
                          color: MyColors.myGrey,
                        ),
                        filled: true,
                        fillColor: MyColors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: MyColors.inputBorder,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: MyColors.inputBorder,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: MyColors.primary,
                          ),
                        ),
                      ),
                    ),
                    20.sbh,
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.filteredStudents.length,
                      separatorBuilder: (_, __) => 12.sbh,
                      itemBuilder: (context, index) {
                        final student = cubit.filteredStudents[index];
                        return StudentCard(student: student);
                      },
                    ),
                    20.sbh,
                  ],
                );
              },
            ),
          ),
*/
        ],
      ),
    );
  }
}
