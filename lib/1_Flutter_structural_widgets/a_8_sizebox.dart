import 'package:flutter/material.dart';

class A8Sizebox extends StatelessWidget {
  const A8Sizebox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is SizeBox example',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Text'),
            SizedBox(
              height: 10,),
            Text('Text'),
            SizedBox(height: 10,),
            Text('Text'),
            SizedBox(height: 10,),
            Text('Text'),
            SizedBox(
              height: 200,
              width: 200,
              child:
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    )
                  ),
                  onPressed: (){}, child: Text('Save')),
            ),
            Text('Text'),
          ],
        ),
      ),
    );
  }
}
