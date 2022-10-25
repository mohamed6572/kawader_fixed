import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kwader/layout/Home_layout.dart';
import 'package:kwader/layout/cubit/cubit.dart';
import 'package:kwader/modules/social_login/Login_screan.dart';
import 'package:kwader/shared/Bloc_Observer.dart';
import 'package:kwader/shared/components/constens.dart';
import 'package:kwader/shared/network/local/casheHelper.dart';

import 'layout/cubit/states.dart';
import 'modules/social_Register/cubit/Cubit.dart';

void main() {
  BlocOverrides.runZoned(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();

      await casheHelper.Init();
      uIdd = casheHelper.getData(key: "uIdd");

      Widget? widget;

      if (uIdd != null) {

        widget = Home_Layout();
      } else {
        widget = LoginScrean();
      }
      print(uIdd);

      runApp(MyApp(
        StartWidget: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );


}

class MyApp extends StatelessWidget {
  Widget? StartWidget;
  MyApp({required this.StartWidget});
  @override
  Widget build(BuildContext context) {
    return
    MultiBlocProvider(providers: [
      BlocProvider(  create: (context) => AppCubit()
        ..getUserData()
        ..getSilderImage()
        ..getpas()
        ..getcli()
        ..getofficeposts()
        ,


      ),
      BlocProvider( create: (context) => RegisterCubit(),)
    ], child:  BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) =>  MaterialApp(
        debugShowCheckedModeBanner: false,

        home: EasySplashScreen(
          logo:Image(image: AssetImage("assets/images/logo.jpeg")),
          logoSize: 100,

          backgroundColor: Colors.white,
          showLoader: false,
          navigator: FirebaseAuth.instance.currentUser !=null? Home_Layout():LoginScrean(),
          durationInSeconds: 2,
        ),

      ),
    ));




  }
}
//