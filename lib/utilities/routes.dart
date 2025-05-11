import 'package:flutter/material.dart';

import '../view/content_screen/content_screen.dart';
import '../view/other_screen/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  Splash.routeName: (context) => const Splash(),
};
