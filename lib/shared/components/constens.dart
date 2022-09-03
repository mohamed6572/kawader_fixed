import 'package:flutter/services.dart';
import 'package:kwader/shared/components/components.dart';
import 'package:kwader/shared/network/local/casheHelper.dart';

import '../../modules/social_login/Login_screan.dart';

void SignOut(context) {
  casheHelper.removeData(key: 'uIdd').then((value) {
    if(value){
       navigateToAndFinish(context, LoginScrean());
    }
  });
}
String? uIdd='';
String? privecy;

getPrivecyText()async{
  String response;
  response =await rootBundle.loadString('assets/images/privecy.txt');
privecy = response;
}
String? call;

getCAllText()async{
  String response1;
  response1 =await rootBundle.loadString('assets/images/call1.txt');
call = response1;
}