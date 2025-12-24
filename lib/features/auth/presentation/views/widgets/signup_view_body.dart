import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_apps/constants.dart';
import 'package:fruits_apps/core/helper_function/build_error_bar.dart';
import 'package:fruits_apps/core/widgets/custom_button.dart';
import 'package:fruits_apps/core/widgets/custom_text_form_field.dart';
import 'package:fruits_apps/core/widgets/password_field.dart';
import 'package:fruits_apps/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_apps/features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:fruits_apps/features/auth/presentation/views/widgets/terms_and_condition.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, userName, password;
  late bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  userName = value!;
                },
                hintText: 'الاسم كامل',
                textInputType: TextInputType.name,
              ),
              SizedBox(height: 16),
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
              TermsAndCondition(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),
              SizedBox(height: 30),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
                      context.read<SignupCubit>().creatUserWithEmailAndPassword(
                        email,
                        userName,
                        password,
                      );
                    } else {
                      buildErrorBar(
                        context,
                        'يجب الموافقة على الشروط والأحكام',
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'انشاء حساب جديد',
              ),
              SizedBox(height: 26),
              HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
