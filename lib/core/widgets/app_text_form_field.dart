import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';


class AppTextFormField extends StatelessWidget {
  final String labelText;
  const AppTextFormField({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      onTapUpOutside: (y){FocusScope.of(context).unfocus();},
      decoration:  InputDecoration(
        filled: true,
        fillColor: Color(0xffF7F8F9),
        border: OutlineInputBorder(
          borderSide: BorderSide()
        ),
       enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor)
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor)
        ),
        label: Text(labelText),
        labelStyle: AppTextStyle.text15Regular.copyWith(
          color: Color(0xff8391A1)
        ),



      ),
    );
  }
}
