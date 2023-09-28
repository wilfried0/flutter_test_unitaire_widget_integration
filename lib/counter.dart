import 'package:flutter/material.dart';

class Counter {
  int number = 0;

  Counter();

  increment() {
    number = number+1;
  }

  Color setColor() => (number.isEven) ? Colors.green : Colors.deepPurple;
}