import 'package:flutter/material.dart';

import 'package:adaptive_material/adaptive_material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.green,
        ),
      ),
      home: const MyHomePage(title: 'Adaptive Material Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      backgroundMaterial: _getMaterial(
        initialMaterial: AdaptiveMaterialType.primary,
      ),
      appBar: AdaptiveAppBar(
        material: _getMaterial(initialMaterial: AdaptiveMaterialType.secondary),
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Note that all text and icons update to reflect the colors '
            'they\'re drawn on top of\n\n\n\n',
            textAlign: TextAlign.center,
          ),
          const Text(
            'You have pushed the button this many times:',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.add),
              Icon(Icons.abc),
              Icon(Icons.exposure_minus_1),
            ],
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4!,
          ),
        ],
      ),
      floatingActionButton: AdaptiveFloatingActionButton(
        material: _getMaterial(initialMaterial: AdaptiveMaterialType.error),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  AdaptiveMaterialType _getMaterial({
    required AdaptiveMaterialType initialMaterial,
  }) {
    const List<AdaptiveMaterialType> values = AdaptiveMaterialType.values;
    return values[(values.indexOf(initialMaterial) + _counter) % values.length];
  }
}
