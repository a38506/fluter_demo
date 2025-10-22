import 'package:flutter/material.dart';
import 'package:temp_project/theme/constants.dart';

class SimpleTitleWidget extends StatelessWidget {
  final Widget? action;
  final Widget? title;
  final Widget? subTitle;

  const SimpleTitleWidget({Key? key, this.title, this.subTitle, this.action})
      : super(key: key);

  factory SimpleTitleWidget.forDesignTime() {
    return const SimpleTitleWidget(
      title: Text('Sale'),
      subTitle: Text('Super summer sale'),
      action: Text('View all'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: kPaddingStandard,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Title + Subtitle ---
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.onBackground,
                  ),
                  child: title ?? const SizedBox(),
                ),
                const SizedBox(height: 2),
                DefaultTextStyle(
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: Colors.grey[600],
                    height: 1.3,
                  ),
                  child: subTitle ?? const SizedBox(),
                ),
              ],
            ),
          ),

          // --- Action (ví dụ "Xem tất cả") ---
          if (action != null)
            DefaultTextStyle(
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
              child: action!,
            ),
        ],
      ),
    );
  }
}
