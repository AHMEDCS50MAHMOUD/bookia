import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/features/cart/cubit/cart_cubit.dart';
import 'package:bookia/features/cart/data/models/cart_models.dart';
import 'package:bookia/features/cart/widgets/cart_checout_section.dart';
import 'package:bookia/features/cart/widgets/cart_item_card.dart';
import 'package:bookia/features/home/data/models/books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  static final _dummyCartItems = List.generate(
    3,
    (_) => CartItem.fromJson({
      'item_id': 0,
      'product': {
        'id': 0,
        'name': 'Book Title Placeholder',
        'price': '285',
        'image': null,
      },
      'item_quantity': 1,
    }),
  );

  @override
  Widget build(BuildContext context) => BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is RemoveFromCartSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 1),
                backgroundColor: Colors.green,
                content: Text('Item removed from cart'),
              ),
            );
          } else if (state is RemoveFromCartError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.redAccent,
                content: Text(state.message),
              ),
            );
          }
        },
        buildWhen: (previous, current) =>
            current is GetCartLoading ||
            current is GetCartSuccess ||
            current is GetCartError,
        builder: (context, state) {
          final isLoading = state is GetCartLoading;

          if (state is GetCartError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.message,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () => context.read<CartCubit>().getCart(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                    ),
                    child: const Text(
                      "Retry",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          }

          final cartItems =
              state is GetCartSuccess ? state.cartItems : _dummyCartItems;

          final totalPrice = state is GetCartSuccess ? state.totalPrice : 0.0;

          if (state is GetCartSuccess && cartItems.isEmpty) {
            return Center(
              child: Text(
                "Your cart is empty",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey,
                ),
              ),
            );
          }

          return Skeletonizer(
            enabled: isLoading,
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: cartItems.length,
                    separatorBuilder: (_, _) => Divider(
                      height: 16.h,
                      thickness: 1,
                      color: const Color(0xffE8ECF4),
                    ),
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return CartItemCard(
                        title: item.product?.name ?? '',
                        price: double.tryParse(
                              item.product?.price ?? '0',
                            ) ??
                            0,
                        imageUrl: item.product?.image ?? '',
                        quantity: item.quantity ?? 1,
                        onIncrement: () =>
                            context.read<CartCubit>().updateCartItem(
                                  cartItemId: item.id ?? 0,
                                  quantity: (item.quantity ?? 1) + 1,
                                ),
                        onDecrement: () {
                          final currentQty = item.quantity ?? 1;
                          if (currentQty > 1) {
                            context.read<CartCubit>().updateCartItem(
                                  cartItemId: item.id ?? 0,
                                  quantity: currentQty - 1,
                                );
                          }
                        },
                        onRemove: () => context
                            .read<CartCubit>()
                            .removeFromCart(item.id ?? 0),
                      );
                    },
                  ),
                ),
                SizedBox(height: 24.h),
                CartCheckoutSection(totalPrice: totalPrice),
                SizedBox(height: 26.h),
              ],
            ),
          );
        },
      );
}
