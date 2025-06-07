import 'package:flutter/material.dart';
import 'package:desafio_task_master/core/app_theme.dart';

class PageIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  const PageIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
            (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index
                ? AppColors.textLight
                : AppColors.indicatorInactive,
          ),
        ),
      ),
    );
  }
}
