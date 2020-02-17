import 'package:flutter/material.dart';
class Time{
static Widget showTime(String time) {
  return Row(
    children: <Widget>[
      Icon(
        Icons.access_time,
        size: 16,
        color: Colors.grey,
      ),
      Text(
        " $time min",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
      )
    ],
  );
}}