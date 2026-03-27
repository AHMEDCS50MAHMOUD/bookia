import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/custom_image_network.dart';
import 'package:bookia/features/cart/cubit/cart_cubit.dart';
import 'package:bookia/features/home/data/models/books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItem extends StatelessWidget {
  final Product? book;
  const BookItem({super.key, this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(11.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.bookBackGround,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CustomImageNetwork(
                url: book?.image ?? "", height: 175.h, width: double.infinity),
          ),
          SizedBox(height: 5.h),
          Expanded(
            child: Text(
              book?.name ?? "",
              style: AppTextStyle.text18Regular,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "${book?.price ?? "0"} EGP",
                  style: AppTextStyle.text15Regular.copyWith(fontSize: 16.sp),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (book?.id != null) {
                    context.read<CartCubit>().addToCart(book!.id!);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${book?.name} added to cart!"),
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 4.h),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Text(
                    "Buy",
                    style:
                        AppTextStyle.text20Regular.copyWith(color: Colors.white, fontSize: 14.sp),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
