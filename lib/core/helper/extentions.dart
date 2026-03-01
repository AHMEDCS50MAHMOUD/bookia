

import 'package:flutter/material.dart';

extension Navigation on BuildContext{
pushNamed(String routName){
  return Navigator.of(this).pushNamed(routName);

}
pushNamedAndRemoveUntil(String routName){
  return Navigator.of(this).pushNamedAndRemoveUntil(routName,(c)=>false);

}
pop()=>Navigator.of(this).pop();

}