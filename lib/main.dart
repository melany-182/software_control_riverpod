import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:software_practica_riverpod/custom%20class/counter_custom.dart';
import 'package:software_practica_riverpod/simple/counter_simple.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: RiverpodHome());
  }
}

class RiverpodHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod examples'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RiverpodSimpleCounterExample(),
                  ),
                );
              },
              child: Text('Riverpod simple counter example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RiverpodCustomCounterExample(),
                  ),
                );
              },
              child: Text('Riverpod custom counter example'),
            ),
          ],
        ),
      ),
    );
  }
}
