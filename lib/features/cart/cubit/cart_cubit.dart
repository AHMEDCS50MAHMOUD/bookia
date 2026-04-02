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

        if (response.data != null) {
          emit(
            GetCartSuccess(
              response.data!.cartItems ?? [],
              response.data!.total ?? 0,
            ),
          );
        } else {
          emit(GetCartSuccess([], 0));
        }
      } else {
        emit(GetCartError('Failed to load cart data'));
      }
    } catch (e) {
      debugPrint('===> GetCart Exception: $e');
      emit(GetCartError('An error occurred while loading cart'));
    }
  }

  Future<void> addToCart(int productId) async {

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
      emit(AddToCartError('Error adding item to cart'));
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
        emit(RemoveFromCartError('Failed to remove item'));
      }
    } catch (e) {
      debugPrint('===> RemoveFromCart Exception: $e');
      emit(RemoveFromCartError('Error removing item'));
    }
  }

  Future<void> updateCartItem({
    required int cartItemId,
    required int quantity,
  }) async {
    try {
      final success = await CartRepo.updateCartItem(
        cartItemId: cartItemId,
        quantity: quantity,
      );
      if (success) {
        emit(UpdateCartItemSuccess());
        await getCart();
      } else {
        emit(UpdateCartItemError('Failed to update quantity'));
      }
    } catch (e) {
      debugPrint('===> UpdateCartItem Exception: $e');
      emit(UpdateCartItemError('Error updating quantity'));
    }
  }
}
