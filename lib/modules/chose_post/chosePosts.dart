import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kwader/layout/cubit/cubit.dart';
import 'package:kwader/layout/cubit/states.dart';
import 'package:kwader/modules/new_post/New_Post_client_Screan.dart';
import 'package:kwader/modules/new_post/New_Post_office_Screan.dart';
import 'package:kwader/shared/components/components.dart';

class ChosePosts extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder:(context , state)=>
          Center(child:
          Column(

            children: [
              SizedBox(height: 40,),

              Container(

                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 17, 91, 128)
                ),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child:   TextButton(

                    onPressed: (){
                      navigateTo(context, New_Post_office_Screan());
                    }, child: Text('المكاتب'.toUpperCase(),style: TextStyle(
                    color: Colors.white,
                    fontSize: 24
                ),)),
              ),

              SizedBox(height: 20,),
              Container(

                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                    color: Colors.white
                ),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child:   TextButton(

                    onPressed: (){
                      navigateTo(context, New_Post_client_Screan());
                    }, child: Text('الشغالات'.toUpperCase(),style: TextStyle(
                    color: Colors.black,
                    fontSize: 24
                ),)),
              ),

            ],
          )
            ,)
    );
  }
}
