import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kwader/layout/cubit/cubit.dart';
import 'package:kwader/layout/cubit/states.dart';
import 'package:kwader/shared/components/constens.dart';

class privcy extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text( 'الخصوصية'),
        ),
      body:  Center(child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
           margin: EdgeInsets.all(15),
           padding: EdgeInsets.all(20),
           child: Column(
             children: [
               Text(privecy??'',style: TextStyle(height: 1.8,fontSize: 12,fontWeight: FontWeight.bold))

             ],
           ),
         ),
      )),
    );

  }

}
