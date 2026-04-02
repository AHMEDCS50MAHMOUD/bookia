import 'package:bookia/features/wishlist/cubit/wisllist_cubit.dart';
import 'package:bookia/features/wishlist/presentation/widget/wishlist_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:bookia/features/home/data/models/books_model.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  static final _dummyProducts = List.generate(
    5,
    (_) => Product(id: 0, name: 'Book Title', price: '285', image: null),
  );

  @override
  void initState() {
    super.initState();
    context.read<WishlistCubit>().getWishlist();
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
                "Wishlist",
                style: TextStyle(
                  fontFamily: 'DM Serif Display',
                  fontSize: 24.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: BlocConsumer<WishlistCubit, WishlistState>(
                  listener: (context, state) {
                    if (state is RemoveFromWishlistSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.green,
                          content: Text('Removed from Wishlist Successfully'),
                        ),
                      );
                    } else if (state is RemoveFromWishlistError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.redAccent,
                          content: Text('Failed to remove from Wishlist'),
                        ),
                      );
                    }
                  },
                  buildWhen: (previous, current) =>
                      current is GetWishlistLoading ||
                      current is GetWishlistSuccess ||
                      current is GetWishlistError,
                  builder: (context, state) {
                    final isLoading = state is GetWishlistLoading;

                    if (state is GetWishlistError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Failed to load wishlist.'),
                            TextButton(
                              onPressed: () => context.read<WishlistCubit>().getWishlist(),
                              child: const Text("Retry"),
                            )
                          ],
                        ),
                      );
                    }

                    final products = state is GetWishlistSuccess
                        ? state.products
                        : _dummyProducts;

                    if (state is GetWishlistSuccess && products.isEmpty) {
                      return const Center(
                        child: Text('No items in wishlist'),
                      );
                    }

                    return Skeletonizer(
                      enabled: isLoading,
                      child: ListView.separated(
                        itemCount: products.length,
                        separatorBuilder: (_, _) => SizedBox(height: 16.h),
                        itemBuilder: (context, index) {
                          return WishlistItemCard(
                            product: products[index],
                            onRemove: () {
                              context.read<WishlistCubit>().removeFromWishlist(products[index].id ?? 0);
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
