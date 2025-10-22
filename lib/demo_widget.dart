import 'package:flutter/material.dart';
import 'widgets.dart';

class DemoWidget extends StatelessWidget {
  const DemoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo widget'),
      ),
      body: Container(
        child: CategoryCardWidget.forDesignTime(),
      ),
    );
  }
}
