import 'package:flutter/material.dart';
import 'package:temp_project/features.dart';
import 'theme/dynamic_theme_widget.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'main',
      theme: DynamicTheme.of(context).themeData,
      routes: {
        'main': (context) => MainPage(),
      },
    );
  }
}
