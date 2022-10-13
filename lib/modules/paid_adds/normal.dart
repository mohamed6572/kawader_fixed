import 'package:flutter/material.dart';

class normal_Screen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body:Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('اعلان مثبت لمده اسبوع',style: TextStyle(
              fontSize: 32
            ),),
            TextButton(style:ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)
            ),onPressed: (){}, child: Text('5 ريال عمانى',style: TextStyle(color: Colors.white,fontSize: 22),))
          ],
        ),
      ),
    );
  }
}
