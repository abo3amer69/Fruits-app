import 'package:flutter/material.dart';
import 'package:fruits_apps/constants.dart';
import 'package:fruits_apps/core/utils/app_colors.dart';
import 'package:fruits_apps/core/utils/app_text_styles.dart';
import 'package:fruits_apps/core/widgets/custom_button.dart';
import 'package:fruits_apps/core/widgets/custom_text_form_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'البريد الالكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              suffixIcon: Icon(Icons.remove_red_eye, color: Color(0xffC9CECF)),
              hintText: 'كلمة المرور ',
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 33),
            CustomButton(onPressed: () {}, text: 'تسجيل الدخول'),
             SizedBox(height: 33),
            Text.rich(
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
            ),
          ],
        ),
      ),
    );
  }
}
