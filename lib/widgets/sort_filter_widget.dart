import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:temp_project/theme/app_icons.dart';

class SortFilterWidget extends StatefulWidget {
  const SortFilterWidget({Key? key}) : super(key: key);

  @override
  _SortFilterWidgetState createState() => _SortFilterWidgetState();
}

class _SortFilterWidgetState extends State<SortFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextButton(
            onPressed: () {},
            child: Row(
              children: <Widget>[
                SvgPicture.asset(AppIcons.filter, color: Colors.black),
                const SizedBox(width: 8),
                Text(
                  'Filters',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              children: <Widget>[
                SvgPicture.asset(AppIcons.sort, color: Colors.black),
                const SizedBox(width: 8),
                Text(
                  'Price: lowest to high',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.view_column),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
