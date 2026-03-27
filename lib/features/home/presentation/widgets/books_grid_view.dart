import 'package:bookia/features/home/cubit/home_cubit.dart';
import 'package:bookia/features/home/data/models/books_model.dart';
import 'package:bookia/features/home/presentation/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BooksGridview extends StatelessWidget {
  final List<Product>? books;
  final bool isLoading;
  const BooksGridview({super.key,  this.books,  this.isLoading=true});

  @override
  Widget build(BuildContext context) {
    return isLoading?SliverToBoxAdapter(
      child: Skeletonizer(
        enabled: true,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 11.h,
            crossAxisSpacing: 11.w,
            childAspectRatio: .55,
          ),
          itemBuilder: (context, index) => BookItem(
            book: Product(
              name: "Loading Content...",
              price: "000",
              image: "",
            ),
          ),
          itemCount: 6,
        ),
      ),
    ): SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 11.h,
          crossAxisSpacing: 11.w,
          childAspectRatio: .55),
      itemBuilder: (context, index) => BookItem(
        book: books?[index],
      ),
      itemCount:books?.length??0,
    );











  }
}
