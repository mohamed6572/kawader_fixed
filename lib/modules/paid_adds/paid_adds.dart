import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kwader/layout/Home_layout.dart';
import 'package:kwader/shared/components/components.dart';

class paid_Adds extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('الباقات'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: GridView.count(crossAxisCount: 1,
          childAspectRatio: 4/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            paid_widget(
              text: 'الباقة الذهبية',
              context: context,
              iconColor: Colors.amber,
              icon: Icons.star,
              widget: Home_Layout()
            ), paid_widget(
              text: 'الباقة الفضية',
              context: context,
              iconColor: Colors.blueGrey.shade200,
              icon: Icons.star,
              widget: Home_Layout()
            ), paid_widget(
              text: 'الباقة العادية',
              context: context,
              iconColor: Colors.blueGrey.shade100,
              icon: Icons.style,
              widget: Home_Layout()
            ),
          ],
          ),
        ),
      )
    );
  }
  Widget paid_widget({required Color iconColor,required IconData icon,required String text , required widget,required context})=>GestureDetector(
    onTap: (){
      navigateTo(context, widget);
    },
    child: Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blueAccent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 80,
          ),
          SizedBox(height: 10,),
          Text(text,style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            color: Colors.white
          ),)
        ],
      ),

    ),
  );
}
