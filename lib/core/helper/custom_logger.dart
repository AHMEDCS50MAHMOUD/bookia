

import 'package:flutter/foundation.dart';

void customLogger(data){

  if(kDebugMode){
   debugPrint(data.toString());
  }
}

// flutter pub run build_runner build --delete-conflicting-outputs)
