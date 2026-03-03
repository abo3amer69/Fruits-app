import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_apps/core/cubits/product_cubit/product_cubit_cubit.dart';
import 'package:fruits_apps/core/helper_function/get_dummy_product.dart';
import 'package:fruits_apps/core/widgets/custom_error_widget.dart';
import 'package:fruits_apps/features/home/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellingGridViewBlocBuilder extends StatelessWidget {
  const BestSellingGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductCubitState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return BestSellingGridView(
            products: state.products,
          );
        } else if (state is ProductFailure) {
          return CustomErrorWidget(text: state.errMessage);
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: BestSellingGridView(
              products: getDummyProducts(),
            ),
          );
        }
      },
    );
  }
}
