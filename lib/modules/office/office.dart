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
            backgroundColor: Colors.grey[200],
              appBar: AppBar(
                actions: [

                  GestureDetector(
                    onTap: (){
                      navigateTo(context, Search(collection: 'posts',));
                    },

                      child: Icon(Icons.search)),
                  SizedBox(width: 15,),
                ],
                centerTitle: true,
                title: Text(title),
              ),
              body:Container(
                padding: EdgeInsetsDirectional.all(10),

                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.52,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
  Widget BuildGridProduct(context, addModel model) => Material(
    child: InkWell(
      onTap: () {
        navigateTo(context, add_Details(model: model));
      },
      child: Container(

        width: 200,
        height: 290,
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
                        Image(
                          image: NetworkImage('${model.image}'),
                          width: double.infinity,
                          height: 190,
                        ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              '${model.title}',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14, height: 1.3),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${model.price}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style:
                              TextStyle(fontSize: 12, color: Colors.blue),
                            ),
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
