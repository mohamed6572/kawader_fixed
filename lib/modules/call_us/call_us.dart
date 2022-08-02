import 'package:flutter/material.dart';
import 'package:kwader/shared/components/constens.dart';
class Call_US extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اتصل بنا'),
      ),
      body: Center(child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        child: Text(call??'',textAlign: TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
      )),
    );
  }
}
