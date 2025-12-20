import 'package:flutter/material.dart';
import 'package:fruits_apps/constants.dart';
import 'package:fruits_apps/core/widgets/custom_button.dart';
import 'package:fruits_apps/core/widgets/custom_text_form_field.dart';
import 'package:fruits_apps/features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:fruits_apps/features/auth/presentation/views/widgets/terms_and_condition.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Column(
           children: [
            SizedBox(height: 24,),
             CustomTextFormField(
                hintText: 'الاسم كامل',
                textInputType: TextInputType.name,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
               
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),

               CustomTextFormField(
               suffixIcon: Icon(Icons.remove_red_eye, color: Color(0xffC9CECF)),
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              TermsAndCondition(),
              SizedBox(height: 30,),
              CustomButton(onPressed: (){}, text: 'انشاء حساب جديد'),
              SizedBox(height: 26,),
              HaveAnAccountWidget(),
           ],
        ),
      ),
    );
  }
}