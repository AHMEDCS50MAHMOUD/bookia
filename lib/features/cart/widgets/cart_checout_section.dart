import 'package:bookia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartCheckoutSection extends StatelessWidget {
  const CartCheckoutSection({required this.totalPrice, super.key});

  final double totalPrice;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            children: [
              Text(
                "Total",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Text(
                'EGP ${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            height: 55.h,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              child: Text(
                "Checkout",
                style: TextStyle(
                  fontFamily: 'DM Serif Display',
                  fontSize: 20.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
}
