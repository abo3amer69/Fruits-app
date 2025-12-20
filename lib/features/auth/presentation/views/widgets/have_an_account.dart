import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_apps/core/utils/app_colors.dart';
import 'package:fruits_apps/core/utils/app_text_styles.dart';
import 'package:fruits_apps/features/auth/presentation/views/signup_view.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            
            text: 'تمتلك حساب بالفعل ؟',
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          TextSpan(
            text: '  ',
            style: TextStyles.semiBold16.copyWith(color: Color(0xff616A6B)),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
            text: 'قم بتسجيل الدخول ',
            style: TextStyles.semiBold16.copyWith(color: Color(0xff949D9E)),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
