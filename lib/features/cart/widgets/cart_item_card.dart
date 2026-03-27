import 'package:bookia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
    super.key,
  });

  final String title;
  final double price;
  final String imageUrl;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                imageUrl,
                width: 100.w,
                height: 118.h,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  width: 100.w,
                  height: 118.h,
                  decoration: BoxDecoration(
                    color: AppColors.bookBackGround,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.book,
                    size: 40.sp,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontFamily: 'DM Serif Display',
                            fontSize: 18.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: onRemove,
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints.tightFor(
                          width: 24.w,
                          height: 24.h,
                        ),
                        icon: Icon(
                          Icons.close,
                          size: 22.sp,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'EGP $price',
                    style: TextStyle(
                      fontFamily: 'DM Serif Display',
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 28.h),
                  _QuantityStepper(
                    quantity: quantity,
                    onIncrement: onIncrement,
                    onDecrement: onDecrement,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class _QuantityStepper extends StatelessWidget {
  const _QuantityStepper({
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _StepperButton(icon: Icons.add, onTap: onIncrement),
          SizedBox(width: 15.w),
          Text(
            quantity.toString().padLeft(2, '0'),
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 15.w),
          _StepperButton(icon: Icons.remove, onTap: onDecrement),
        ],
      );
}

class _StepperButton extends StatelessWidget {
  const _StepperButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6.r),
        child: Container(
          width: 30.w,
          height: 30.h,
          decoration: BoxDecoration(
            color: const Color(0xffE8ECF4),
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Icon(icon, size: 18.sp, color: Colors.black),
        ),
      );
}
