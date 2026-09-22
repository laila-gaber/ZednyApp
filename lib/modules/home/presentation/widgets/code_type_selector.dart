import 'package:flutter/material.dart';

import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/code_type_enum.dart';

class CodeTypeSelector extends StatelessWidget {
  final CodeTypeEnum selectedType;
  final ValueChanged<CodeTypeEnum> onSelected;

  const CodeTypeSelector({
    super.key,
    required this.selectedType,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Row(
      children: [
        Expanded(
          child: _buildTypeButton(
            context: context,
            type: CodeTypeEnum.revision,
            label: s.revision,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildTypeButton(
            context: context,
            type: CodeTypeEnum.book,
            label: s.book,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildTypeButton(
            context: context,
            type: CodeTypeEnum.lecture,
            label: s.lecture,
          ),
        ),
      ],
    );
  }

  Widget _buildTypeButton({
    required BuildContext context,
    required CodeTypeEnum type,
    required String label,
  }) {
    final isSelected = selectedType == type;

    return GestureDetector(
      onTap: () => onSelected(type),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? MyColors.primaryDark : MyColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? MyColors.primaryDark : MyColors.inputBorder,
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: isSelected ? MyColors.white : MyColors.myBlack,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
        ),
      ),
    );
  }
}
