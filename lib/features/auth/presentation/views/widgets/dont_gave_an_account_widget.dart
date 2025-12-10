
import 'package:flutter/material.dart';
import 'package:fruits_apps/core/utils/app_colors.dart';
import 'package:fruits_apps/core/utils/app_text_styles.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'ليس لديك حساب؟ ',
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          TextSpan(
            text: '  ',
            style: TextStyles.semiBold16.copyWith(
              color: Color(0xff616A6B),
            ),
          ),
          TextSpan(
            text: 'انشاء حساب',
            style: TextStyles.semiBold16.copyWith(
              color: Color(0xff949D9E),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
