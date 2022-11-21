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
          // We need to manually set `onBackground` because the default value
          // set by `fromSwatch` is too low contrast. Flutter pls fix.
          onBackground: Colors.black,
          // Override on surface just to demonstrate more variety of text color.
          onSurface: Colors.indigo.shade800,
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
        leading: const Icon(Icons.color_lens),
        title: Text(widget.title),
      ),
      // Use a builder to ensure that we get a reference to a `BuildContext`
      // below `AdaptiveScaffold`.
      body: Builder(builder: (context) {
        // We can directly get the enclosing material type.
        final AdaptiveMaterialType material = AdaptiveMaterial.of(context)!;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'background color:\n${material.toString().split('.').last}',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    // We can get the `onColor` of the current context.
                    color: AdaptiveMaterial.onColorOf(context),
                  ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Observe that all text and icons update to reflect the colors '
              'they\'re drawn on top of.',
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.add),
                Icon(Icons.access_time),
                Icon(Icons.play_circle),
              ],
            ),
            const Text(
              '\n\nWhen we use `AdaptiveMaterial.<material> widgets the '
              'children beneath them will automatically use the appropriate '
              '`on<material>` color:',
              textAlign: TextAlign.center,
            ),
            const AdaptiveMaterial.primary(
              child: Text(
                'This text is `onPrimary`.',
                textAlign: TextAlign.center,
              ),
            ),
            const AdaptiveMaterial.secondary(
              child: Text(
                'This text is `onSecondary`.',
                textAlign: TextAlign.center,
              ),
            ),
            const AdaptiveMaterial.error(
              child: Text(
                'This text is `onError`.',
                textAlign: TextAlign.center,
              ),
            ),
            const AdaptiveMaterial.background(
              child: Text(
                'This text is `onBackground`.',
                textAlign: TextAlign.center,
              ),
            ),
            const AdaptiveMaterial.surface(
              child: Text(
                'This text is `onSurface`.',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      }),
      floatingActionButton: AdaptiveFloatingActionButton(
        material: _getMaterial(initialMaterial: AdaptiveMaterialType.error),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.navigate_next),
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
