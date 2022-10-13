
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kwader/layout/cubit/cubit.dart';
import 'package:kwader/layout/cubit/states.dart';
import 'package:kwader/modules/about_app/about_app.dart';
import 'package:kwader/modules/call_us/call_us.dart';
import 'package:kwader/modules/chose_post/chosePosts.dart';
import 'package:kwader/modules/privcy/privcy.dart';
import 'package:kwader/shared/components/components.dart';

import '../modules/paid_adds/paid_adds.dart';
import '../shared/components/constens.dart';

class Home_Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if(state is AppNewPostState){
            navigateTo(context, ChosePosts());
          }
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);

          return SafeArea(
            child: Scaffold(
drawer: Drawer(
  child:   Column(
   // mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image(image: AssetImage('assets/images/logo.jpeg')),
      SizedBox(height: 30,),
      drawerWidget(icon: Icons.home, text: 'الرئيسية',ontap: (){
        Navigator.pop(context);
        cubit.backtohome();
      }),
      drawerWidget(icon: Icons.info, text: 'عن التطبيق',ontap: (){
        navigateTo(context, About_App());
      }),
      drawerWidget(icon: Icons.paid, text: 'الباقات',ontap: (){
        navigateTo(context, paid_Adds());
      }),
      drawerWidget(icon: Icons.list_alt, text: 'الخصوصية',ontap: ()async{
       await getPrivecyText();
         navigateTo(context, privcy());
      }),
      drawerWidget(icon: Icons.call_rounded, text: 'اتصل بنا',ontap: ()async{
        await getCAllText();
         navigateTo(context, Call_US());
      }),
      drawerWidget(icon: Icons.share, text: 'مشاركة التطبيق',ontap: (){}),
      drawerWidget(icon: Icons.logout, text: 'خروج',ontap: (){ SignOut(context);}),

    ],
  ),
),
              appBar: AppBar(
                title: Text(cubit.titles[cubit.CurrentIndex]),


              ),
              body: cubit.Screans[cubit.CurrentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.CurrentIndex,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                onTap: (index){
                  cubit.ChangeIndex(index);
                },
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home),label: 'الرئيسية'),

                  BottomNavigationBarItem(icon: Icon(Icons.upload_file),label: 'اضافه اعلان'),

                  BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'الاعدادات'),
                ],
              ),
            ),
          );
        },

    );
  }
  Widget drawerWidget({required icon,required text,required ontap})=> InkWell(
    onTap: ontap,
    child: Container(
      margin: EdgeInsets.only(left:  15),
      padding: EdgeInsets.all(15),
      child:Row(
        children: [
          Icon(icon,size: 45,color: Colors.blue.shade700,),
          SizedBox(width: 15,),
          Text(text,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
        ],

      ) ,
    ),
  );
}
