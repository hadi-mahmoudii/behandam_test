import 'package:flutter/material.dart';

extension AccessContext on BuildContext {
  NavigatorState get navigator => Navigator.of(this);

  String get currentRoute => ModalRoute.of(this)!.settings.name!;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  FocusScopeNode get focusScope => FocusScope.of(this);

  ThemeData get theme => Theme.of(this);

  ScaffoldMessengerState get scaffold => ScaffoldMessenger.of(this);

  TextDirection get direction => Directionality.of(this);

  bool get isRtl => direction == TextDirection.rtl;

  String get fontFamily => DefaultTextStyle.of(this).style.fontFamily ?? '';
}
