import 'package:bookia/core/helper/extentions.dart';
import 'package:bookia/core/routing/routes.dart';
import 'package:bookia/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,    children: [
        Assets.images.logo.image(width: 100.w),
       InkWell (onTap:(){context.pushNamed(Routes.searchScreen);} ,
           child: SvgPicture.asset(Assets.icons.search))
      ],
    );
  }
}
