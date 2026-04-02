import 'package:bookia/core/routing/routes.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: AppTextStyle.text20Regular.copyWith(fontFamily: 'DM Serif Display'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
              if (context.mounted) {
                Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false);
              }
            },
            icon: const Icon(Icons.logout, color: Colors.red),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.person, size: 50.r, color: Colors.grey),
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ahmed mahmoud",
                        style: AppTextStyle.text20Regular.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Ahmed@gmail.com",
                        style: AppTextStyle.text15Regular.copyWith(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 30.h),
              _ProfileItem(
                title: "My Orders",
                onTap: () {},
              ),
              _ProfileItem(
                title: "Edit Profile",
                onTap: () {},
              ),
              _ProfileItem(
                title: "Reset Password",
                onTap: () {},
              ),
              _ProfileItem(
                title: "FAQ",
                onTap: () {},
              ),
              _ProfileItem(
                title: "Contact Us",
                onTap: () {},
              ),
              _ProfileItem(
                title: "Privacy & Terms",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _ProfileItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ],
          ),
          child: Row(
            children: [
              Text(
                title,
                style: AppTextStyle.text18Regular,
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
