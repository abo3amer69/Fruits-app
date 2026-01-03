import 'package:flutter/material.dart';
import 'package:fruits_apps/core/utils/app_text_styles.dart';
import 'package:fruits_apps/core/widgets/build_app_bar.dart';
import 'package:fruits_apps/core/widgets/custom_app_bar.dart';
import 'package:fruits_apps/core/widgets/notification_widget.dart';
import 'package:fruits_apps/features/best_selling_fruit/presentation/views/widget/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  static const routeName = 'best-selling_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBarr(), body: BestSellingViewBody());
  }
}
