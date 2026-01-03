import 'package:flutter/material.dart';
import 'package:fruits_apps/core/utils/app_text_styles.dart';
import 'package:fruits_apps/core/widgets/notification_widget.dart';

AppBar buildAppBarr() {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const NotificationWidget(),
      ),
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      'الاكثر مبيعا',
      textAlign: TextAlign.center,
      style: TextStyles.bold19,
    ),
  );
}
