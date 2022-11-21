Never manually define text or icon colors again!

Adaptive Material is an alternative to `Material` and the material widget suite
(`Scaffold`, `AppBar`, etc) that uses `ColorScheme` and inherited widgets to 
automatically set the color of foreground elements (`Text`, `Icon`, etc) to 
correspond to the color of the backgrounds they're drawn on top of.

## Getting Started

Anywhere where you would use `Material`, or `Scaffold` etc, use the corresponding
`Adaptive*` widget instead.
The `AdaptiveMaterial` system will use `DefaultTextStyle` and `IconTheme` to style all
widgets below it with the correct foreground element color according to `colorScheme`.

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveMaterial.surface(
      child: Text(
        'This text will be drawn on top of `ColorScheme.surface` and will automatically '
        'use `ColorScheme.onSurface` as its text color.',
      ),
    );
  }
}
```

For more detailed usage, see the included full example.