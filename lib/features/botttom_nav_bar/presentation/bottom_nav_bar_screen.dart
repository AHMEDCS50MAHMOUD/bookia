import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/features/cart/cubit/cart_cubit.dart';
import 'package:bookia/features/cart/presentation/cart_screen.dart';
import 'package:bookia/features/home/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/home_screen.dart';
import 'package:bookia/features/profile/presentation/profile_screen.dart';
import 'package:bookia/features/wishlist/presentation/wishlist_screen.dart';
import 'package:bookia/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const WishlistScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..getSlider()..getBestSellerBooks(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    Assets.icons.home,
                    colorFilter: currentIndex == 0
                        ? ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)
                        : null,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Assets.icons.bookMark,
                      colorFilter: currentIndex == 1
                          ? ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)
                          : null),
                  label: ""),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Assets.icons.category,
                      colorFilter: currentIndex == 2
                          ? ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)
                          : null),
                  label: ""),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Assets.icons.profile,
                      colorFilter: currentIndex == 3
                          ? ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)
                          : null),
                  label: ""),
            ]),
        body: IndexedStack(
          index: currentIndex,
          children: _screens,
        ),
      ),
    );
  }
}
