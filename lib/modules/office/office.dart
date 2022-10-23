import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kwader/layout/Home_layout.dart';
import 'package:kwader/layout/cubit/cubit.dart';
import 'package:kwader/layout/cubit/states.dart';
import 'package:kwader/modules/search/search.dart';
import 'package:kwader/shared/components/components.dart';

import '../../models/add_model.dart';
import '../add/add_details.dart';
import 'package:intl/intl.dart';

class Office extends StatelessWidget {
  String title ;
  Office({required this.title});
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => AppCubit()..getofficeposts(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.black),
                actions: [

                  GestureDetector(
                    onTap: (){
                      navigateTo(context, Search(collection: 'posts',));
                    },

                      child: Icon(Icons.search,color: Colors.black,)),
                  SizedBox(width: 15,),
                ],
                centerTitle: true,
                title: Text(title,style: TextStyle(color: Color.fromARGB(
                    255, 23, 218, 245),fontWeight: FontWeight.bold),),
              ),
              body:Container(
                padding: EdgeInsetsDirectional.all(10),

                child: GridView.count(
                  crossAxisCount: 1,
                  childAspectRatio: 1 / 0.77,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  shrinkWrap: true,
                  children: List.generate(
                      AppCubit.get(context).posts.length,
                          (index) => ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: BuildGridProduct(context,AppCubit.get(context).posts[index]))),
                ),


              )
              // ListView.separated(
              //   itemCount:AppCubit.get(context).clients.length ,
              //   scrollDirection: Axis.vertical,
              //   itemBuilder: (context,index) =>BuildGridProduct(context,AppCubit.get(context).clients[index]),
              //   separatorBuilder: (BuildContext context, int index) => SizedBox(width: 9,height: 7,) ,
              // ),
          );
        },

      ),
    );
  }
  var date = DateFormat.yMd().add_jm().format(DateTime.now());
  Widget BuildGridProduct(context, addModel model) => Material(
    child: InkWell(
      onTap: () {
        navigateTo(context, add_Details(model: model));
      },
      child: Container(

        width: 200,
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
                          child:  Image(
                            image: NetworkImage('${model.image}'),
                            width: double.infinity,
                            fit: BoxFit.fill,
                            height: 150,
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.
                          stretch,
                          children: [
                            Text(
                              '${model.title}',
                              maxLines: 2,
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 22, height: 1.3,color: Color.fromARGB(
                                  255, 23, 218, 245),fontWeight: FontWeight.bold),
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
                                  style:
                                  TextStyle(fontSize: 18, color: Color.fromARGB(
                                      255, 62, 56, 115),fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 9,),
                                Text(
                                  'السعر ',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                  style:
                                  TextStyle(fontSize: 16, color: Color.fromARGB(
                                      255, 23, 218, 245),fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [

                                    Text(
                                      ' ${model.dateTime?.substring(0,11)}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.end,
                                      style:
                                      TextStyle(fontSize: 14, color: Color.fromARGB(
                                          255, 23, 218, 245),fontWeight: FontWeight.bold),

                                    ),
                                    Icon(Icons.calendar_month_outlined),
                                  ],
                                ),
                                Row(
                                  children: [

                                    Text(
                                      ' ${model.dateTime?.substring(10,16)}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.end,
                                      style:
                                      TextStyle(fontSize: 14, color: Color.fromARGB(
                                          255, 23, 218, 245),fontWeight: FontWeight.bold),

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
