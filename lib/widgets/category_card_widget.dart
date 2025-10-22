import 'package:flutter/material.dart';
import 'package:temp_project/theme/app_icons.dart';

class CategoryCardWidget extends StatelessWidget {
  final Widget title;
  final String asset;
  final Widget? subtitle;
  final VoidCallback? onTap;

  const CategoryCardWidget(
    this.title,
    this.asset, {
    this.subtitle,
    this.onTap,
    Key? key,
  }) : super(key: key);

  factory CategoryCardWidget.forDesignTime() {
    return const CategoryCardWidget(Text('New'), AppIcons.categoryCard1);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // ✅ gọi hàm được truyền từ bên ngoài
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: AspectRatio(
          aspectRatio: 3.43,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultTextStyle(
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.w800),
                        child: title,
                      ),
                      if (subtitle != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: DefaultTextStyle(
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.grey[600]),
                            child: subtitle!,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Image.asset(asset, fit: BoxFit.cover),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
