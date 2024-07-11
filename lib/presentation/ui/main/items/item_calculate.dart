import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget itemCalculate(){
  return Container(
    height: 32,
    width: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.deepPurple
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0.0,),
      child: Row(
        children: [
        SizedBox(width: 8.0,),
          SvgPicture.asset(
            'assets/images/calculate.svg',
            width: 20,
            height: 20,
            color: Colors.white,
          ),
          Text('Hisoblash', style: TextStyle(color: Colors.white),),
       //   SizedBox(width: 16.0,),

        ],
      ),
    ),
    );
}

Widget converter(){
  return Container(
    width: 38,
    height: 38,
    decoration: BoxDecoration(
      color: Colors.deepPurple,
      borderRadius: BorderRadius.circular(8.0)
    ),
    child:Center(
      child: SvgPicture.asset('assets/images/arrow.svg', color: Colors.white, width: 18,height: 18,),
    )
  );
}