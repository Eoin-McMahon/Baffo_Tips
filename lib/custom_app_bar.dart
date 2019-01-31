import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget{
  final String title;
  final double barHeight = 6.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context)
  {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      height: barHeight + statusBarHeight,
      child:
          new Center(
              child: Text(
                title,
                textAlign: TextAlign.left,
                style:  TextStyle(
                  color: Colors.white,
                  // fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 36.0
                ),
              ), 
          ),    
      
    
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:
          [
            
            //0xFF7CB356B
            //0xFFbd3f32
             Color(0xFF2F334E),
             Color(0xFF3A3B69),
          ],
          begin:  FractionalOffset(0.0, 0.0),
          end:  FractionalOffset(1.0, 0.0),
          stops: [0.0,0.8],
          tileMode: TileMode.clamp
        ),
        ),
    );
  }
}