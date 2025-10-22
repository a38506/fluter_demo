import 'package:flutter/material.dart';
import 'package:temp_project/theme/dynamic_theme_widget.dart';

class BannerSimple2Widget extends StatelessWidget {
  final Widget title;
  final Widget subTitle;

  const BannerSimple2Widget(this.title, this.subTitle, {super.key});

  factory BannerSimple2Widget.forDesignTime() {
    return const BannerSimple2Widget(
      Text('SUMMER SALES'),
      Text('Up to 50% off'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColor = DynamicTheme.of(context).customColor;

    return AspectRatio(
      aspectRatio: 3.43,
      child: Container(
        decoration: ShapeDecoration(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          color: customColor.colorSaleHot,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextStyle(
              style: theme.textTheme.headlineSmall?.copyWith(
                color: customColor.onColorSaleHot,
                fontWeight: FontWeight.w800,
              ) ??
                  TextStyle(
                    color: customColor.onColorSaleHot,
                    fontWeight: FontWeight.w800,
                  ),
              child: title,
            ),
            DefaultTextStyle(
              style: theme.textTheme.bodyLarge?.copyWith(
                color: customColor.onColorSaleHot,
              ) ??
                  TextStyle(
                    color: customColor.onColorSaleHot,
                  ),
              child: subTitle,
            ),
          ],
        ),
      ),
    );
  }
}
