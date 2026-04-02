import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/custom_image_network.dart';
import 'package:bookia/features/cart/cubit/cart_cubit.dart';
import 'package:bookia/features/wishlist/cubit/wisllist_cubit.dart';
import 'package:bookia/features/home/data/models/books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItem extends StatefulWidget {
  final Product? book;
  const BookItem({super.key, this.book});

  @override
  State<BookItem> createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  bool isAddingToCart = false;

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
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CustomImageNetwork(
                    url: widget.book?.image ?? "", height: 175.h, width: double.infinity),
              ),
              Positioned(
                top: 5.h,
                right: 5.w,
                child: GestureDetector(
                  onTap: () {
                    if (widget.book?.id != null) {
                      context.read<WishlistCubit>().addToWishlist(widget.book!.id!);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Added to Wishlist!"),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: const Icon(Icons.bookmark_border, size: 20, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Expanded(
            child: Text(
              widget.book?.name ?? "",
              style: AppTextStyle.text18Regular,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "${widget.book?.price ?? "0"} EGP",
                  style: AppTextStyle.text15Regular.copyWith(fontSize: 16.sp),
                ),
              ),
              GestureDetector(
                onTap: isAddingToCart
                    ? null
                    : () async {
                        if (widget.book?.id != null) {
                          setState(() {
                            isAddingToCart = true;
                          });

                          // استدعاء الكيوبيت لإضافة المنتج
                          await context.read<CartCubit>().addToCart(widget.book!.id!);

                          if (mounted) {
                            setState(() {
                              isAddingToCart = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("${widget.book?.name} added to cart!"),
                                backgroundColor: Colors.green,
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          }
                        }
                      },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 4.h),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4.r)),
                  child: isAddingToCart
                      ? SizedBox(
                          height: 20.h,
                          width: 20.h,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          "Buy",
                          style: AppTextStyle.text20Regular
                              .copyWith(color: Colors.white, fontSize: 14.sp),
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
