import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/features/home/presentation/widgets/book_item.dart';
import 'package:bookia/features/home/presentation/widgets/books_grid_view.dart';
import 'package:bookia/features/home/presentation/widgets/home_app_bar.dart';
import 'package:bookia/features/home/presentation/widgets/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 12.w),
        child: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppBar(),
              SizedBox(height: 20.h,),
              HomeSlider(),
              SizedBox(height: 20.h,),
              Text("Best Seller",style: AppTextStyle.text20Regular.copyWith(
                fontSize: 24.sp
              ),)
              ,SizedBox(height: 10.h,),
            ],
          ),


        ),
        BooksGridview()


      ]


        ),
      ),
    );
  }
}
