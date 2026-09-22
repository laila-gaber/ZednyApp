import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/values/my_colors.dart';
import '../../data/enum/user_type_enum.dart';
import '../cubit/auth_cubit.dart';

class UserTypeSelector extends StatelessWidget {
  const UserTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AuthCubit>();
    final selectedUserType = cubit.selectedUserType;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColors.descriptionColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: UserTypeEnum.values.map((type) {
          final isSelected = type == selectedUserType;
          return Expanded(
            child: GestureDetector(
              onTap: () => cubit.changeUserType(type),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? MyColors.blue : MyColors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: MyColors.blue.withValues(alpha: 0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : [],
                ),
                child: Center(
                  child: Text(
                    type.label(context),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: isSelected ? MyColors.white : MyColors.myBlack,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w500,
                        ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
