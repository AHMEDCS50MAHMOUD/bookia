import 'package:bookia/core/routing/routes.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/features/home/data/models/books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(10.w),
    decoration: BoxDecoration(
      color: AppColors.bookBackGround,
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.bookDetails, arguments: product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(
                product.image ?? '',
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                const Center(child: Icon(Icons.book, size: 48)),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            product.name ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'DM Serif Display',
              fontSize: 17.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                'EGP ${product.price ?? '0'}',
                style: TextStyle(
                  fontFamily: 'DM Serif Display',
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 72.w,
                height: 30.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Buy",
                    style: TextStyle(
                      fontFamily: 'DM Serif Display',
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
