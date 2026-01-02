import 'package:flutter/material.dart';
import 'package:fruits_apps/constants.dart';
import 'package:fruits_apps/core/widgets/search_text_field.dart';
import 'package:fruits_apps/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_apps/features/home/presentation/views/widgets/featured_item.dart';
import 'package:fruits_apps/features/home/presentation/views/widgets/featured_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
