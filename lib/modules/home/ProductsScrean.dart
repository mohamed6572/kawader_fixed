import 'package:buildcondition/buildcondition.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kwader/layout/Home_layout.dart';
import 'package:kwader/layout/cubit/cubit.dart';
import 'package:kwader/layout/cubit/states.dart';
import 'package:kwader/modules/office/office.dart';
import 'package:kwader/shared/components/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:intl/intl.dart';

import '../../models/add_model.dart';
import '../add/add_details.dart';
import '../maids/maids.dart';
import '../paid_adds/paid_adds.dart';

class ProductsScrean extends StatefulWidget {
  const ProductsScrean({Key? key}) : super(key: key);

  @override
  State<ProductsScrean> createState() => _ProductsScreanState();
}

class _ProductsScreanState extends State<ProductsScrean> {
  var boardController = PageController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getSilderImage()
        ..getofficeposts()
        ..getClientposts(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Material(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: BuildCondition(
                condition: AppCubit.get(context).slider != 0,
                //AppCubit.get(context).slider.length >=0
                fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
                builder: (context) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                        items: AppCubit.get(context)
                            .slider
                            .map((e) => GestureDetector(
                                  onTap: () {
                                    navigateTo(context, paid_Adds());
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(
                                        image: NetworkImage('${e.image}'),
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              activeIndex = index;
                            });
                          },
                          scrollDirection: Axis.horizontal,
                          autoPlay: true,
                          height: 130.0,
                          initialPage: 0,
                          reverse: false,
                          viewportFraction: 1.0,
                          enableInfiniteScroll: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(seconds: 1),
                          autoPlayCurve: Curves.fastOutSlowIn,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: AnimatedSmoothIndicator(
                        activeIndex: activeIndex,
                        count: AppCubit.get(context).slider.length,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                navigateTo(
                                  context,
                                  Office(
                                    title: 'مكاتب الشغالات',
                                  ),
                                );
                              },
                              child: Text('الكل',
                                  style: TextStyle(
                                      fontSize: 18,
                                      height: 1.3,
                                      color:
                                          Color.fromARGB(255, 23, 218, 245)))),
                          Text('مكاتب الشغالات',
                              style: TextStyle(
                                  fontSize: 18,
                                  height: 1.3,
                                  color: Color.fromARGB(255, 23, 218, 245)))
                        ],
                      ),
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     tap(
                    //         widget: Office(
                    //           title: 'مكاتب الشغالات',
                    //         ),
                    //         icon: Icons.apartment,
                    //         context: context,
                    //         text: 'مكاتب الشغالات'
                    //     ),    tap(
                    //         widget: Maids(
                    //           title: 'الشغالات',
                    //         ),
                    //         icon: Icons.cleaning_services,
                    //         context: context,
                    //         text: 'الشغالات'
                    //     ),
                    //   ]
                    //   ,
                    // ),
                    // SizedBox(height: 20,),
                    // Center(
                    //   child: tap(
                    //       widget: paid_Adds(),
                    //       icon: Icons.campaign,
                    //       context: context,
                    //       text: 'الاعلانات المدفوعه'
                    //   ),
                    // ),
                    Container(
                      height: 283,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: BuildGridProduct(
                                  context, AppCubit.get(context).posts[index])),
                          separatorBuilder: (context, index) => SizedBox(
                                width: 10,
                              ),
                          itemCount: AppCubit.get(context).posts.length),
                    ),

                    SizedBox(height: 10,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                navigateTo(
                                  context,
                                  Maids(
                                    title: 'الشغالات',
                                  ),
                                );
                              },
                              child: Text('الكل',
                                  style: TextStyle(
                                      fontSize: 18,
                                      height: 1.3,
                                      color:
                                      Color.fromARGB(255, 23, 218, 245)))),
                          Text('الشغالات',
                              style: TextStyle(
                                  fontSize: 18,
                                  height: 1.3,
                                  color: Color.fromARGB(255, 23, 218, 245)))
                        ],
                      ),
                    ),
                    Container(
                      height: 283,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: BuildGridProduct(
                                  context, AppCubit.get(context).clients[index])),
                          separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                          itemCount: AppCubit.get(context).clients.length),
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
    required icon,
    required text,
  }) =>
      GestureDetector(
        onTap: () {
          navigateTo(context, widget);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 3),
          height: 140,
          width: 140,
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 45,
                color: Colors.white,
              ),
              Text(
                text,
                style: TextStyle(
                    height: 2,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )
            ],
          ),
        ),
      );

  var date = DateFormat.yMd().add_jm().format(DateTime.now());

  Widget BuildGridProduct(context, addModel model) => Material(
        child: InkWell(
          onTap: () {
            navigateTo(context, add_Details(model: model));
          },
          child: Container(
            width: 270,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (model.image != '')
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image(
                                image: NetworkImage('${model.image}'),
                                width: double.infinity,
                                fit: BoxFit.fill,
                                height: 150,
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  '${model.title}',
                                  maxLines: 1,
                                  textAlign: TextAlign.end,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 22,
                                      height: 1.3,
                                      color: Color.fromARGB(255, 23, 218, 245),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      ' ${model.price}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color:
                                              Color.fromARGB(255, 62, 56, 115),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 9,
                                    ),
                                    Text(
                                      'السعر ',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Color.fromARGB(255, 23, 218, 245),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          ' ${model.dateTime?.substring(0, 11)}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color.fromARGB(
                                                  255, 23, 218, 245),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(Icons.calendar_month_outlined),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          ' ${model.dateTime?.substring(10, 16)}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color.fromARGB(
                                                  255, 23, 218, 245),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(Icons.watch_later_outlined),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    // if(isUser==true)

                    // MaterialButton(onPressed: (){},

                    //   height: 20,

                    //   padding: EdgeInsets.all(0),

                    //   minWidth: 40,

                    //   elevation: 0.0,

                    //   color: Colors.red,

                    //   child: Icon(Icons.delete),

                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
