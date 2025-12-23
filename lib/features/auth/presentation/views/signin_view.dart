import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_apps/core/services/get_it_services.dart';
import 'package:fruits_apps/core/utils/app_text_styles.dart';
import 'package:fruits_apps/core/widgets/custom_app_bar.dart';
import 'package:fruits_apps/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_apps/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits_apps/features/auth/presentation/views/widgets/signin_view_body.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل الدخول'),
        body: SigninViewBody(),
      ),
    );
  }
}
