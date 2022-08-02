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
          Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Center(child:
          Column(
            children: [
              defultTextButtton(text: 'مكاتب', function:(){
                navigateTo(context, New_Post_office_Screan());
              } ),
              SizedBox(height: 20,),
              defultTextButtton(text: 'شغالات', function:(){
                navigateTo(context, New_Post_client_Screan());
              } ),
            ],
          )
          ,),
      ),
    );
  }
}
