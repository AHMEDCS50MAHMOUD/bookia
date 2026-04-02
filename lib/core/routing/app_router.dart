import 'package:bookia/core/routing/routes.dart';
import 'package:bookia/features/auth/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/login_screen.dart';
import 'package:bookia/features/auth/presentation/register_screen.dart';
import 'package:bookia/features/botttom_nav_bar/presentation/bottom_nav_bar_screen.dart';
import 'package:bookia/features/cart/presentation/cart_screen.dart';
import 'package:bookia/features/home/presentation/home_screen.dart';
import 'package:bookia/features/on_boarding/presentation/on_boarding_screen.dart';
import 'package:bookia/features/search/cubit/search_cubit.dart';
import 'package:bookia/features/search/presentation/search_screen.dart';
import 'package:bookia/features/wishlist/presentation/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case Routes.home:
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.login:
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthCubit(),
            child: const LoginScreen(),
          ),
        );

      case Routes.register:
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const RegisterScreen(),
          ),
        );

      case Routes.bottomNavBar:
      case Routes.bottomNavBarScreen:
        return MaterialPageRoute(builder: (_) => const BottomNavBarScreen());

      case Routes.cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());

      case Routes.search:
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => SearchCubit(),
            child: const SearchScreen(),
          ),
        );

      case Routes.wishlist:
        return MaterialPageRoute(builder: (_) => const WishlistScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
