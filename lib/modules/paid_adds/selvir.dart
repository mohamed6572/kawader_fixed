import 'package:flutter/material.dart';

class Silver_Screen extends StatelessWidget{

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
            Text('اعلان مثبت لمده اسبوعين',style: TextStyle(
              fontSize: 32
            ),),
            TextButton(style:ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)
            ),onPressed: (){}, child: Text('10 ريال عمانى',style: TextStyle(color: Colors.white,fontSize: 22),))
          ],
        ),
      ),
    );
  }
}
