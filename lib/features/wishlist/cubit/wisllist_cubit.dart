import 'package:bloc/bloc.dart';
import 'package:bookia/features/home/data/models/books_model.dart';
import 'package:bookia/features/wishlist/data/models/wishlist_model.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter/material.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  Future<void> getWishlist() async {
    emit(GetWishlistLoading());
    try {
      final response = await WishlistRepo.getWishlist();
      if (response != null && response.data != null) {
        emit(GetWishlistSuccess(response.data!.products ?? []));
      } else {
        emit(GetWishlistError("Failed to load wishlist"));
      }
    } catch (e) {
      debugPrint('===> GetWishlist Exception: $e');
      emit(GetWishlistError(e.toString()));
    }
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(RemoveFromWishlistLoading());
    try {
      final success = await WishlistRepo.removeFromWishlist(productId);
      if (success) {
        emit(RemoveFromWishlistSuccess());
        await getWishlist();
      } else {
        emit(RemoveFromWishlistError("Failed to remove item"));
      }
    } catch (e) {
      debugPrint('===> RemoveFromWishlist Exception: $e');
      emit(RemoveFromWishlistError(e.toString()));
    }
  }

  Future<void> addToWishlist(int productId) async {
    try {
      final success = await WishlistRepo.addToWishlist(productId);
      if (success) {
        await getWishlist();
      }
    } catch (e) {
      debugPrint('===> AddToWishlist Exception: $e');
    }
  }
}
