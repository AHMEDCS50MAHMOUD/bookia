part of 'wisllist_cubit.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

final class GetWishlistLoading extends WishlistState {}

final class GetWishlistSuccess extends WishlistState {
  final List<Product> products;
  GetWishlistSuccess(this.products);
}

final class GetWishlistError extends WishlistState {
  final String message;
  GetWishlistError(this.message);
}

final class RemoveFromWishlistLoading extends WishlistState {}

final class RemoveFromWishlistSuccess extends WishlistState {}

final class RemoveFromWishlistError extends WishlistState {
  final String message;
  RemoveFromWishlistError(this.message);
}

final class AddToWishlistLoading extends WishlistState {}

final class AddToWishlistSuccess extends WishlistState {}

final class AddToWishlistError extends WishlistState {
  final String message;
  AddToWishlistError(this.message);
}
