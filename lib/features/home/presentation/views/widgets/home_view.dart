import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_apps/core/cubits/product_cubit/product_cubit_cubit.dart';
import 'package:fruits_apps/core/repos/product_repo/product_repo.dart'
    show ProductRepo;
import 'package:fruits_apps/core/services/get_it_services.dart' show getIt;
import 'package:fruits_apps/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(getIt.get<ProductRepo>()),
      child: HomeViewBody(),
    );
  }
}
