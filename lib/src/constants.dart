import 'package:flutter/material.dart';

TextStyle txtStyle = TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold);

String getDate(String date){
  var data = DateTime.parse(date);

  return data.day.toString()+'/'+ data.month.toString()+'/' + data.year.toString();

}