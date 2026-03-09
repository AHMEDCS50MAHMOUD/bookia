import 'package:bookia/features/home/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksGridview extends StatelessWidget {
  const BooksGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prev, current) =>
          current is GetBestSellerSuccess ||
          current is GetBestSellerLoading ||
          current is GetBestSellerError,
      builder: (context, state) {
        if (state is GetBestSellerLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is GetBestSellerSuccess) {
          return SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 11.h,
                crossAxisSpacing: 11.w,
                childAspectRatio: .55),
            itemBuilder: (context, index) => BookItem(
              book: state.books[index],
            ),
            itemCount: state.books.length,
          );
        } else if (state is GetBestSellerError) {
          return const SliverToBoxAdapter(
            child: Center(child: Text("Failed to load books.Please try again.")),
          );
        }
        // Fallback for initial state before loading starts
        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
