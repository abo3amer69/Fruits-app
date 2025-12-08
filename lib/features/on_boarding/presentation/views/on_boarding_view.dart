import 'package:flutter/material.dart';
import 'package:fruits_apps/features/on_boarding/presentation/views/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static const routeName = 'OnBoardingView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const OnBoardingViewBody(),
    );
  }
}