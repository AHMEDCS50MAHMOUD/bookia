import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/features/home/cubit/home_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen:(prev,current)=>current is GetHomeSlidersSuccess || current is GetHomeSlidersLoading
      || current is GetHomeSlidersError
      ,
      builder: (context, state) {
        if( state is GetHomeSlidersLoading || state is GetBestSellerLoading){
          return Skeletonizer(
            enabled: true,
            child: Container(
             height: 200.h,
             width: double.infinity,
              color: Colors.grey,
            ),
          );
        }
        else if(state is GetHomeSlidersSuccess) {
          return Column(
            children: [
              CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0.h,
                    autoPlay: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                  items: List.generate(state.Sliders.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.network(state.Sliders[index].image??""
                          , width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  })
              ),
              SizedBox(height: 14.h,),
              AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: state.Sliders.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 7.h,
                  activeDotColor: AppColors.primaryColor,
                ),
              )
            ],
          );
        } else {
          return
            Text("Error");

        }
      },
    );
  }
}
