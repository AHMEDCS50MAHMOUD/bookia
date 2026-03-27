import 'package:bloc/bloc.dart';
import 'package:bookia/features/cart/data/models/cart_models.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:flutter/material.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> getCart() async {
    emit(GetCartLoading());
    try {
      final response = await CartRepo.getCart();
      if (response != null) {
        final cartModel = CartModel.fromJson(response as Map<String, dynamic>);
        if (cartModel.data != null) {
          emit(
            GetCartSuccess(
              cartModel.data!.cartItems ?? [],
              cartModel.data!.total ?? 0,
            ),
          );
        } else {
          emit(GetCartError('Cart is empty'));
        }
      } else {
        emit(GetCartError('Failed to load cart'));
      }
    } catch (e) {
      debugPrint('===> GetCart Exception: $e');
      emit(GetCartError('Failed to load cart'));
    }
  }

  Future<void> removeFromCart(int cartItemId) async {
    emit(RemoveFromCartLoading());
    try {
      final success = await CartRepo.removeFromCart(cartItemId);
      if (success) {
        emit(RemoveFromCartSuccess());
        await getCart();
      } else {
        emit(RemoveFromCartError('Failed to remove item from cart'));
      }
    } catch (e) {
      debugPrint('===> RemoveFromCart Exception: $e');
      emit(RemoveFromCartError('Failed to remove item from cart'));
    }
  }

  Future<void> updateCartItem({
    required int cartItemId,
    required int quantity,
  }) async {
    emit(UpdateCartItemLoading());
    try {
      final success = await CartRepo.updateCartItem(
        cartItemId: cartItemId,
        quantity: quantity,
      );
      if (success) {
        emit(UpdateCartItemSuccess());
        await getCart();
      } else {
        emit(UpdateCartItemError('Failed to update cart item'));
      }
    } catch (e) {
      debugPrint('===> UpdateCartItem Exception: $e');
      emit(UpdateCartItemError('Failed to update cart item'));
    }
  }

  Future<void> addToCart(int productId) async {
    emit(AddToCartLoading());
    try {
      final success = await CartRepo.addToCart(productId);
      if (success) {
        emit(AddToCartSuccess());
        await getCart();
      } else {
        emit(AddToCartError('Failed to add item to cart'));
      }
    } catch (e) {
      debugPrint('===> AddToCart Exception: $e');
      emit(AddToCartError('Failed to add item to cart'));
    }
  }
}
