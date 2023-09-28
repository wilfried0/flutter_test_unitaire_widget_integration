import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/counter.dart';

void main() {
  test("Initialisation de l'object counter", () {
    Counter counter = Counter();
    expect(counter.number, 0);
    expect(counter.setColor(), Colors.green);
  });

  test("Incrementation du compteur", () {
    Counter counter = Counter();
    counter.increment();
    expect(counter.number, 1);
    expect(counter.setColor(), Colors.deepPurple);
  });
}