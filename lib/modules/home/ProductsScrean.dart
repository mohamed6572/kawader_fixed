import 'package:buildcondition/buildcondition.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kwader/layout/Home_layout.dart';
import 'package:kwader/layout/cubit/cubit.dart';
import 'package:kwader/layout/cubit/states.dart';
import 'package:kwader/modules/office/office.dart';
import 'package:kwader/shared/components/components.dart';

import '../maids/maids.dart';
import '../paid_adds/paid_adds.dart';

class ProductsScrean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create: (context) => AppCubit()..getSilderImage(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Material(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: BuildCondition(
                condition: AppCubit.get(context).slider !=0,
                //AppCubit.get(context).slider.length >=0
                fallback: (context) => Center(child: CircularProgressIndicator(),),
                builder: (context) =>  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(image: AssetImage('assets/images/logo.jpeg')),
                    CarouselSlider(
                        items: AppCubit.get(context).slider
                            .map((e) => GestureDetector(
                          onTap: (){
                            navigateTo(context, paid_Adds());
                          },
                              child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                              image: NetworkImage('${e.image}'),
                              width: double.infinity,
                              fit: BoxFit.contain,
                          ),
                        ),
                            ))
                            .toList(),
                        options: CarouselOptions(
                          scrollDirection: Axis.horizontal,
                          autoPlay: true,
                          height: 230.0,
                          initialPage: 0,
                          reverse: false,
                          viewportFraction: 1.0,
                          enableInfiniteScroll: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(seconds: 1),
                          autoPlayCurve: Curves.fastOutSlowIn,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        tap(
                          widget: Office(
                            title: 'مكاتب الشغالات',
                          ),
                          icon: Icons.apartment,
                          context: context,
                          text: 'مكاتب الشغالات'
                        ),    tap(
                          widget: Maids(
                            title: 'الشغالات',
                          ),
                          icon: Icons.cleaning_services,
                          context: context,
                          text: 'الشغالات'
                        ),
                      ]
                      ,
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: tap(
                          widget: paid_Adds(),
                          icon: Icons.campaign,
                          context: context,
                          text: 'الاعلانات المدفوعه'
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget tap({
  required context,
    required widget,
    required icon ,
    required text,
})=> GestureDetector(
    onTap: (){
      navigateTo(context, widget);
    },
  child:   Container(
    padding:EdgeInsets.symmetric(horizontal: 3) ,

      height: 140,

      width: 140,

      decoration: BoxDecoration(

        color: Colors.blueAccent,

        borderRadius: BorderRadius.circular(20)

      ),

      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,

        crossAxisAlignment: CrossAxisAlignment.center,

        children: [

          Icon(icon,size: 45,color: Colors.white,),

          Text(text,style: TextStyle(height: 2,color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)

        ],

      ),

    ),
);

}
