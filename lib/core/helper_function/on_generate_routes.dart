import 'package:flutter/material.dart';
import 'package:fruits_apps/features/splash/presentation/views/splash_view.dart';

Route onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    default:
      return MaterialPageRoute(builder: (context) => const Placeholder());
  }
}
