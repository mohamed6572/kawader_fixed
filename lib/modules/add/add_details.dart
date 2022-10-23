import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kwader/layout/cubit/cubit.dart';
import 'package:kwader/layout/cubit/states.dart';
import 'package:kwader/models/add_model.dart';
import 'package:kwader/shared/components/components.dart';


class add_Details extends StatelessWidget {
  addModel? model;

  add_Details({required this.model});

  var imageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0.0,
            centerTitle: true,
            title: Text('تفاصيل الشفاله',style: TextStyle(color: Color.fromARGB(
                255, 23, 218, 245),fontWeight: FontWeight.bold),),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    height: 250,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),

                        child:Image(image: NetworkImage('${model?.image}'),width: double.infinity,fit: BoxFit.fill,)
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${model?.title}',
                    style: TextStyle(fontSize: 22,color: Color.fromARGB(
                        255, 23, 218, 245),fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${model?.price}',
                        style: TextStyle(
                            fontSize: 28,
                            color: Color.fromARGB(
                                255, 62, 56, 115),fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        ': السعر',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB( 255, 23, 218, 245),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [

                          Text(
                            ' ${model?.dateTime?.substring(0,11)}',
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
                            ' ${model?.dateTime?.substring(10,16)}',
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
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'التفاصيل',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 22,color: Color.fromARGB( 255, 23, 218, 245)),
                  ),
                  Text(
                    '${model?.decrepthion}',
                    style: TextStyle(
                      height: 1.4,
                      fontSize: 16,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
