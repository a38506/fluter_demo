import 'package:flutter/material.dart';
import 'package:temp_project/widgets/order_history_widget.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  static const String TAG = 'OrderHistoryPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Orders'),
        leading: const BackButton(),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          OrderHistoryWidget(),
          SizedBox(height: 12),
          OrderHistoryWidget(),
          SizedBox(height: 12),
          OrderHistoryWidget(),
        ],
      ),
    );
  }
}
