import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_apps/constants.dart';
import 'package:fruits_apps/core/utils/app_colors.dart';
import 'package:fruits_apps/core/utils/app_images.dart';
import 'package:fruits_apps/core/utils/app_text_styles.dart';
import 'package:fruits_apps/core/widgets/custom_button.dart';
import 'package:fruits_apps/core/widgets/custom_text_form_field.dart';
import 'package:fruits_apps/core/widgets/password_field.dart';
import 'package:fruits_apps/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits_apps/features/auth/presentation/views/widgets/dont_gave_an_account_widget.dart';
import 'package:fruits_apps/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits_apps/features/auth/presentation/views/widgets/social_login_button.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,

          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
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
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubit>().signIn(email, password);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {
                      // to enable autovalidateMode
                    });
                  }
                },
                text: 'تسجيل الدخول',
              ),
              SizedBox(height: 33),
              DontHaveAnAccountWidget(),
              SizedBox(height: 33),
              OrDivider(),
              SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
                image: Assets.imagesGoogleIcon,
                title: 'التسجيل باستخدام جوجل',
              ),
              SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.imagesApplIcon,
                title: 'التسجيل باستخدام ابل',
              ),
              SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.imagesFacebookIcon,
                title: 'التسجيل باستخدام فيسبوك',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
