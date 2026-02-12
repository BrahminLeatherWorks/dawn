import 'package:flutter/material.dart';

class DaySelector extends StatelessWidget {
  const DaySelector({
    super.key,
    required this.selectedDays,
    required this.onChanged,
  });

  final Set<int> selectedDays;
  final ValueChanged<Set<int>> onChanged;

  static const _labels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: List.generate(7, (index) {
        final day = index + 1;
        final isSelected = selectedDays.contains(day);
        return FilterChip(
          label: Text(_labels[index]),
          selected: isSelected,
          onSelected: (selected) {
            final next = {...selectedDays};
            if (selected) {
              next.add(day);
            } else {
              next.remove(day);
            }
            onChanged(next);
          },
        );
      }),
    );
  }
}
