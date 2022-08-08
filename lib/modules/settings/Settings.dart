import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kwader/layout/cubit/cubit.dart';
import 'package:kwader/layout/cubit/states.dart';
import 'package:kwader/shared/components/components.dart';
import 'package:kwader/shared/components/constens.dart';

class App_Settings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getUserData()..getpas()..getcli(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
         var cubit= AppCubit.get(context).userModel;
          return Padding(
           padding: EdgeInsets.all(8),
           child:  SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 if(cubit?.name!=null)
                 Container(
                     width: double.infinity,
                     padding: EdgeInsets.all(15),
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         border: Border.all(color: Colors.grey)
                     ),
                     child: Text('${cubit?.name}',
                       textAlign: TextAlign.start,
                       style: TextStyle(color: Colors.black),)),
                 SizedBox(height: 20,),
                 if(cubit?.phone!=null)
                   Container(
                     width: double.infinity,
                     padding: EdgeInsets.all(15),
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         border: Border.all(color: Colors.grey)
                     ),
                     child: Text('${cubit?.phone?.substring(0,11)}',
                       textAlign: TextAlign.start,
                       style: TextStyle(color: Colors.black),)),
                 SizedBox(height: 20,),

                 SizedBox(height: 20,),
                 defultButton(text: 'تسجيل خروج',
                   radius: 20,
                   width: MediaQuery.of(context).size.width*0.4,
                   Background: Colors.red,
                   function: (){
                     SignOut(context);
                   },),
//                  SizedBox(height: 15,),
//                  defultButton(text: 'ج',
//                    radius: 20,
//                    width: MediaQuery.of(context).size.width*0.4,
//                    Background: Colors.red,
//                    function: (){
// AppCubit.get(context).delete();                   },),
                 SizedBox(height: 15,),
                 Text('اعلاناتك',
                 textAlign: TextAlign.end,
                 style: TextStyle(fontSize: 20,
                 ),
                 ),
                 SizedBox(height: 15,),
                 if(AppCubit.get(context).postsUser.length>0)
                   Container(
                     padding: EdgeInsetsDirectional.only(top: 3),
                     color: Colors.grey[200],
                     child: GridView.count(
                       shrinkWrap: true,
                       physics: NeverScrollableScrollPhysics(),
                       crossAxisCount: 2,
                       mainAxisSpacing: 1.0,
                       crossAxisSpacing: 1.0,
                       childAspectRatio: 1 / 1.5,
                       children: List.generate(AppCubit.get(context).postsUser.length,
                               (index) => BuildGridProduct(context,AppCubit.get(context).postsUser[index])),
                     ),
                   ),
                 SizedBox(height: 15,),
                 if(AppCubit.get(context).clientsUser.length>0)
                   Container(
                     padding: EdgeInsetsDirectional.only(top: 3),
                     color: Colors.grey[200],
                     child: GridView.count(
                       shrinkWrap: true,
                       physics: NeverScrollableScrollPhysics(),
                       crossAxisCount: 2,
                       mainAxisSpacing: 1.0,
                       crossAxisSpacing: 1.0,
                       childAspectRatio: 1 / 1.5,
                       children: List.generate(AppCubit.get(context).clientsUser.length,
                               (index) => BuildGridProduct(context,AppCubit.get(context).clientsUser[index])),
                     ),
                   )
               ],
             ),
           ),
         );
        },
      ),
    );
  }
}
