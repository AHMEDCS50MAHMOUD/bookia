
import 'package:bookia/gen/assets.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Text("hello".tr(),
         style: TextStyle(
           fontSize: 40,

         ),)
          ,InkWell(
              onTap: (){
               if(context.locale.languageCode=="ar"){
                 context.setLocale(Locale('en'));

               }else{
                context.setLocale(Locale('ar'));}
              },child: Icon(Icons.add)),

        ],
      ),
    );
  }
}
