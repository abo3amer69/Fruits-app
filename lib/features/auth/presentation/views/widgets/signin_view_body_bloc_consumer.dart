import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_apps/core/widgets/custom_progress_hud.dart';
import 'package:fruits_apps/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits_apps/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomProgressHuD(
          isLoading: state is SigninLoading ? true : false,
          child: SigninViewBody(),
        );
      },
    );
  }
}

