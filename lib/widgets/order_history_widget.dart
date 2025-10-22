import 'package:flutter/material.dart';

class OrderHistoryWidget extends StatelessWidget {
  const OrderHistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Order №1947034',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Text('05-12-2019'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: <Widget>[
                const Text('Tracking number: '),
                Text(
                  'IW3475453455',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: <Widget>[
                const Text('Quantity: '),
                Text(
                  '3',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                const Text('Total Amount: '),
                Text(
                  '112\$',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Details'),
                ),
                Text(
                  'Delivered',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
