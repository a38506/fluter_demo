import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temp_project/features/bag/bag_sliver_persistent_header_delegate.dart';
import 'package:temp_project/features/profile/order_history_page.dart';
import 'package:temp_project/widgets/menu_profile_account_item_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final baseTextTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Theme(
        data: Theme.of(context).copyWith(
          textTheme: baseTextTheme.copyWith(
            titleMedium: baseTextTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
        ),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: BagSliverPersistentHeaderDelegate(
                MediaQuery.of(context).padding.top,
              ),
            ),
            const SliverToBoxAdapter(
              child: MenuProfileAccountItemWidget(),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                ListTile(
                  title: const Text('My orders'),
                  subtitle: const Text('Already have 12 orders'),
                  trailing: const Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => OrderHistoryPage(),
                      ),
                    );
                  },
                ),
                const ListTile(
                  title: Text('Shipping addresses'),
                  subtitle: Text('3 addresses'),
                  trailing: Icon(Icons.navigate_next),
                ),
                const ListTile(
                  title: Text('Payment methods'),
                  subtitle: Text('Visa **34'),
                  trailing: Icon(Icons.navigate_next),
                ),
                const ListTile(
                  title: Text('Promocodes'),
                  subtitle: Text('You have special promocodes'),
                  trailing: Icon(Icons.navigate_next),
                ),
                const ListTile(
                  title: Text('My reviews'),
                  subtitle: Text('Reviews for 4 items'),
                  trailing: Icon(Icons.navigate_next),
                ),
                const ListTile(
                  title: Text('Settings'),
                  subtitle: Text('Notifications, password'),
                  trailing: Icon(Icons.navigate_next),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
