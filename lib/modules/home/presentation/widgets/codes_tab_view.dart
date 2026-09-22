import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'code_type_selector.dart';
import 'codes_header.dart';

class CodesTabView extends StatelessWidget {
  const CodesTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final s = S.of(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const CodesHeader(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: MyColors.myGrey.withValues(alpha: 0.12),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        s.codeType,
                        style:
                            Theme.of(context).textTheme.titleSmall?.copyWith(
                                  color: MyColors.myBlack,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      12.sbh,
                      CodeTypeSelector(
                        selectedType: cubit.selectedCodeType,
                        onSelected: (type) => cubit.changeCodeType(type),
                      ),
                      24.sbh,
                      Text(
                        s.selectLecture,
                        style:
                            Theme.of(context).textTheme.titleSmall?.copyWith(
                                  color: MyColors.myBlack,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      8.sbh,
                      DropdownButtonFormField<String>(
                        value: cubit.selectedLecture,
                        hint: Text(
                          s.selectLectureHint,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color: MyColors.myGrey,
                              ),
                        ),
                        isExpanded: true,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: MyColors.myBlack,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: MyColors.offWhite,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: MyColors.inputBorder,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: MyColors.inputBorder,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: MyColors.primary,
                            ),
                          ),
                        ),
                        items: cubit.lectureList
                            .map(
                              (lecture) => DropdownMenuItem<String>(
                                value: lecture,
                                child: Text(
                                  lecture,
                                  textAlign: TextAlign.right,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: MyColors.myBlack,
                                      ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) => cubit.selectLecture(value),
                      ),
                      24.sbh,
                      Text(
                        s.numberOfCodes,
                        style:
                            Theme.of(context).textTheme.titleSmall?.copyWith(
                                  color: MyColors.myBlack,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      8.sbh,
                      TextField(
                        controller: cubit.codeCountController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: MyColors.myBlack,
                              fontWeight: FontWeight.bold,
                            ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: MyColors.offWhite,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: MyColors.inputBorder,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: MyColors.inputBorder,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: MyColors.primary,
                            ),
                          ),
                        ),
                      ),
                      32.sbh,
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () => cubit.generateCodes(s),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.softBlue,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            s.generateCodes,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: MyColors.primaryDark,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
