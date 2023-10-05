import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/providers/counter_provider.dart';
import 'package:test_app/router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Quicksand'
      ),
      routerConfig: router,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          key: const Key('title'),
          title,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        actions: [
          ElevatedButton(
            key: const Key('router'),
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) => Colors.deepPurpleAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(width: 1, color: Colors.deepPurpleAccent)
                      )
                  ),
              ),
              onPressed: () => context.go('/albums'),
              child: const Text("Albums",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
          ),
          const SizedBox(width: 20,)
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Consumer(
              builder: (context, ref, _) {
                final counter = ref.watch(counterProvider);
                return Text(
                  '$counter',
                  style: TextStyle(color: ref.read(counterProvider.notifier).setColor(), fontSize: 30, fontWeight: FontWeight.bold),
                );
              }
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Consumer(
            builder: (context, ref, _) {
              return FloatingActionButton(
                key: const Key('key2'),
                onPressed: () => ref.read(counterProvider.notifier).decremente(),
                tooltip: 'Decrement',
                heroTag: 'tag2',
                child: const Icon(Icons.remove, color: Colors.black,),
              );
            }
          ),
          //const Spacer(),
          Consumer(
            builder: (context, ref, _) {
              return FloatingActionButton(
                key: const Key('key1'),
                onPressed: () => ref.read(counterProvider.notifier).increment(),
                tooltip: 'Increment',
                heroTag: 'tag1',
                child: const Icon(Icons.add, color: Colors.black,),
              );
            }
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
