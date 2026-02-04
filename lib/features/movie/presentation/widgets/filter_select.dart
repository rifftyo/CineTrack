import 'package:flutter/material.dart';

class FilterSelect extends StatelessWidget {
  const FilterSelect({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onSelected,
  });

  final List<MapEntry<String, int?>> items;
  final int? selectedValue;
  final void Function(int? value) onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final entry = items[index];
          final isSelected = entry.value == selectedValue;

          return GestureDetector(
            onTap: () => onSelected(entry.value),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: isSelected
                    ? const LinearGradient(
                        colors: [Color(0xFFAD46FF), Color(0xFFF6339A)],
                      )
                    : null,
                color: isSelected ? null : const Color(0X501E2939),
                border: Border.all(
                  color: isSelected
                      ? Colors.transparent
                      : const Color(0XFFD1D5DC),
                ),
              ),
              child: Center(
                child: Text(
                  entry.key,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey[300],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
