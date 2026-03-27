import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/features/cart/cubit/cart_cubit.dart';
import 'package:bookia/features/cart/widgets/cart_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch cart items when the screen is initialized
    context.read<CartCubit>().getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            children: [
              Text(
                "My Cart",
                style: TextStyle(
                  fontFamily: 'DM Serif Display',
                  fontSize: 24.sp,
                  color: const Color(0xff2F2E41),
                ),
              ),
              SizedBox(height: 20.h),
              const Expanded(child: CartListView()),
            ],
          ),
        ),
      ),
    );
  }
}
