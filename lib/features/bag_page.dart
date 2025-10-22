import 'package:flutter/material.dart';
import 'package:temp_project/theme/app_icons.dart';
import 'bag/bag_item_widget.dart';
import 'bag/bag_sliver_persistent_header_delegate.dart';

class BagPage extends StatefulWidget {
  const BagPage({super.key});

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate:
                BagSliverPersistentHeaderDelegate(MediaQuery.of(context).padding.top),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  BagItemWidget(AppIcons.categoryCard1),
                  const Divider(height: 16, color: Colors.transparent),
                  BagItemWidget(AppIcons.demoProduct2),
                  const Divider(height: 16, color: Colors.transparent),
                  BagItemWidget(AppIcons.categoryCard1),
                  const Divider(height: 16, color: Colors.transparent),
                  BagItemWidget(AppIcons.categoryCard2),
                  const Divider(height: 16, color: Colors.transparent),
                  BagItemWidget(AppIcons.categoryCard1),
                  const Divider(height: 16, color: Colors.transparent),
                  BagItemWidget(AppIcons.demoProduct2),
                  const Divider(height: 16, color: Colors.transparent),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 16),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shadows: kElevationToShadow[2],
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(8),
                      right: Radius.circular(24),
                    ),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      child: Text('Enter your promo code'),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: <Widget>[
                    const Expanded(child: Text('Total amount:')),
                    Text(
                      '124\$',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    'CHECK OUT',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
