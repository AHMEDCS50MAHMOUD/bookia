import 'package:bookia/core/routing/routes.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/features/home/data/models/books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistItemCard extends StatelessWidget {
  const WishlistItemCard({
    super.key,
    required this.product,
    required this.onRemove,
  });

  final Product product;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) => Dismissible(
        key: ValueKey(product.id),
        direction: DismissDirection.endToStart,
        onDismissed: (_) => onRemove(),
        background: Container(
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(4.r),
              bottomRight: Radius.circular(4.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Icon(Icons.cancel_outlined, color: Colors.white, size: 24.sp),
          ),
        ),
        child: Container(
          height: 132.h,
          decoration: BoxDecoration(
            color: AppColors.bookBackGround,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.r),
                  bottomLeft: Radius.circular(5.r),
                ),
                child: Image.network(
                  product.image ?? '',
                  width: 100.w,
                  height: 132.h,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => SizedBox(
                    width: 100.w,
                    child: const Center(child: Icon(Icons.book, size: 40)),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'DM Serif Display',
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        'EGP ${product.price ?? '0'}',
                        style: TextStyle(
                          fontFamily: 'DM Serif Display',
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: SizedBox(
                            width: 120.w,
                            height: 32.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.bookDetails,
                                  arguments: product,
                                );
                              },
                              child: Text(
                                'View Details',
                                style: TextStyle(
                                  fontFamily: 'DM Serif Display',
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
