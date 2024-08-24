
import 'package:flutter/material.dart';
class AppWidget{
  static  TextStyle boldTextFeildStyle(){
    return const TextStyle(
fontSize: 30.0,
  fontWeight:FontWeight.bold,
    color: Colors.black
    );
    
  }
  static TextStyle lightTextFeildStyle(){
    return const TextStyle(color: Colors.black45,
    fontSize: 20.0,
    fontWeight: FontWeight.w500
    );
  }
    static TextStyle semiBoldTextFeildStyle(){
      return const TextStyle(color:
                Colors.black,fontSize: 25,fontWeight:
                 FontWeight.bold);

      
    }  
           
}