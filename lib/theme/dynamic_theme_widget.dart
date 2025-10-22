import 'package:flutter/material.dart';
import 'package:temp_project/theme/custom_theme_data.dart';

class DynamicThemeWidget extends StatefulWidget {
  final Widget child;
  final CustomThemeData customThemeData;
  final ThemeData initThemeData;
  final Locale initLocale;

  const DynamicThemeWidget({
    required this.child,
    required this.customThemeData,
    required this.initThemeData,
    required this.initLocale,
    Key? key,
  }) : super(key: key);

  @override
  State<DynamicThemeWidget> createState() => _DynamicThemeWidgetState();
}

class _DynamicThemeWidgetState extends State<DynamicThemeWidget> {
  late CustomThemeData _customColor;
  late ThemeData _themeData;
  late Locale _locale;

  ThemeData get themeData => _themeData;
  CustomThemeData get customColor => _customColor;
  Locale get locale => _locale;

  @override
  void initState() {
    super.initState();
    _customColor = widget.customThemeData;
    _themeData = widget.initThemeData;
    _locale = widget.initLocale;
  }

  void changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  void changeTheme(ThemeData themeData, CustomThemeData customColor) {
    setState(() {
      _themeData = themeData;
      _customColor = customColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      value: this,
      child: widget.child,
    );
  }
}

class DynamicTheme extends InheritedWidget {
  final _DynamicThemeWidgetState value;

  const DynamicTheme({
    Key? key,
    required this.value,
    required Widget child,
  }) : super(key: key, child: child);

  ThemeData get themeData => value.themeData;
  CustomThemeData get customColor => value.customColor;
  Locale get locale => value.locale;

  void changeTheme(ThemeData themeData, CustomThemeData customColor) {
    value.changeTheme(themeData, customColor);
  }

  void changeLanguage(Locale locale) {
    value.changeLanguage(locale);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static DynamicTheme of(BuildContext context) {
    final DynamicTheme? inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<DynamicTheme>();
    assert(inheritedTheme != null, 'No DynamicTheme found in context');
    return inheritedTheme!;
  }
}
