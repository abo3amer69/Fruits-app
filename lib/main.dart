import 'package:flutter/material.dart';
import 'package:fruits_apps/core/helper_function/on_generate_routes.dart';
import 'package:fruits_apps/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const FruitHub());
}
class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoutes,
      initialRoute: SplashView.routeName,
    );
  }
}
