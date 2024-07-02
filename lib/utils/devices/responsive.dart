
import 'package:flutter/material.dart';

class JFluid{
  JFluid._();

  static double percentWidth({required context,required percent}){
  return MediaQuery.of(context).size.width / 100 * percent ;
 }

  static double percentHeight({required context,required percent}){
  return MediaQuery.of(context).size.height / 100 * percent ;
 }


}