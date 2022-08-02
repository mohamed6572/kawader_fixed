import 'package:flutter/material.dart';

class About_App extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('عن التطبيق'),
      ),
      body: Center(child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        child: Text('تم انشاء  موقع و تطبيق كوادر فور يو كموقع و تطبيق متخصص فى جلب الشغالات و التوظيف بشكل عام.',textAlign: TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
      )),
    );

  }
}
