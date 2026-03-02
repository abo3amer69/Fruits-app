
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_apps/constants.dart';
import 'package:fruits_apps/core/cubits/product_cubit/product_cubit_cubit.dart';
import 'package:fruits_apps/core/widgets/search_text_field.dart' show SearchTextField;
import 'package:fruits_apps/features/home/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:fruits_apps/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruits_apps/features/home/presentation/views/widgets/custom_home_app_bar.dart';

import 'featured_list.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductCubit>().getBestSellingProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: kTopPaddding),
                CustomHomeAppBar(),
                SizedBox(height: 16),
                SearchTextField(),
                SizedBox(height: 12,),
                FeaturedList(),
                SizedBox(height: 12,),
                BestSellingHeader(),
                SizedBox(height: 8,),
                
              ],
            ),
          ),
        BestSellingGridView(),
        ],
      ),
    );
  }
}
