import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class AppTextFormField extends StatefulWidget {
  final String labelText;
  final bool isPassword;
  final TextInputType? keyboardType;
  const AppTextFormField({super.key, required this.labelText,  this.isPassword=false, this.keyboardType});

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isObscure=true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:widget.keyboardType ,
      cursorColor: AppColors.primaryColor,
      obscureText: widget.isPassword&&isObscure,
      onTapUpOutside: (y){FocusScope.of(context).unfocus();},
      decoration:  InputDecoration(
        filled: true,
        suffixIcon:widget.isPassword? InkWell(
          onTap:(){
            setState(() {
              isObscure=!isObscure;
            });
          } ,
          child: Padding(
            padding:  EdgeInsets.all(9.0.r),
            child:isObscure?Icon(Icons.visibility_off_outlined): SvgPicture.asset(Assets.icons.eye,

            ),
          ),
        ):null,

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
        label: Text(widget.labelText),
        labelStyle: AppTextStyle.text15Regular.copyWith(
          color: Color(0xff8391A1)
        ),



      ),
    );
  }
}
