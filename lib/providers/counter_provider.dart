import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider((ref) => CounterProvider());

class CounterProvider extends StateNotifier<int> {
  CounterProvider(): super(0);

  int increment() {
    state++;
    return state;
  }

  int decremente() {
    state--;
    return state;
  }

  Color setColor() => (state.isEven) ? Colors.green : Colors.deepPurple;
}