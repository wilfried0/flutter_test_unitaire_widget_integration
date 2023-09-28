import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FlutterDriver flutterDriver;

  //Trouver nos éléments dans l'app

  //Créer un drive
  setUpAll(() async {
    //Connecter le drive
    flutterDriver = await FlutterDriver.connect();
    //Attendre jusqu'au rendu de la premiere frame
    await flutterDriver.waitUntilFirstFrameRasterized();
  });

  //Fermer à la fin des tests
  tearDownAll(() async {
    flutterDriver.close();
  });
}