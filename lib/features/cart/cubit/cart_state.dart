part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

// Get cart states
final class GetCartLoading extends CartState {}

final class GetCartSuccess extends CartState {
  GetCartSuccess(this.cartItems, this.totalPrice);
  final List<CartItem> cartItems;
  final double totalPrice;
}

final class GetCartError extends CartState {
  GetCartError(this.message);
  final String message;
}

// Remove from cart states
final class RemoveFromCartLoading extends CartState {}

final class RemoveFromCartSuccess extends CartState {}

final class RemoveFromCartError extends CartState {
  RemoveFromCartError(this.message);
  final String message;
}

// Update cart item states
final class UpdateCartItemLoading extends CartState {}

final class UpdateCartItemSuccess extends CartState {}

final class UpdateCartItemError extends CartState {
  UpdateCartItemError(this.message);
  final String message;
}

// Add to cart states
final class AddToCartLoading extends CartState {}

final class AddToCartSuccess extends CartState {}

final class AddToCartError extends CartState {
  AddToCartError(this.message);
  final String message;
}