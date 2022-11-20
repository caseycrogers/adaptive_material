import 'package:adaptive_material/src/adaptive_material_type.dart';
import 'package:flutter/material.dart';

/// An alternative to [Material] that automatically colors itself based off the
/// nearest enclosing color scheme and styles all widgets below it to use the
/// corresponding color scheme colors.
///
/// For example, the following will create a widget that uses
/// `Theme.of(context).colorScheme.background` for it's background color and
/// uses `Theme.of(context).colorScheme.onBackground` for text elements.
///
/// TODO(caseycrogers): Create adaptive equivalents to all the material widgets
///   ([Scaffold], [FloatingActionButton], etc.)
class AdaptiveMaterial extends StatelessWidget {
  /// A base constructor that explicitly sets the [AdaptiveMaterialType].
  ///
  /// Generally, this constructor should not be used. The helper constructors
  /// below offer a cleaner API surface should be used instead.
  const AdaptiveMaterial({
    Key? key,
    required this.material,
    required this.child,
  }) : super(key: key);

  /// An [AdaptiveMaterial] widget based on the color scheme's primary color.
  const AdaptiveMaterial.primary({super.key, required this.child})
      : material = AdaptiveMaterialType.primary;


  /// An [AdaptiveMaterial] widget based on the color scheme's secondary color.
  const AdaptiveMaterial.secondary({super.key, required this.child})
      : material = AdaptiveMaterialType.secondary;

  /// An [AdaptiveMaterial] widget based on the color scheme's error color.
  const AdaptiveMaterial.error({super.key, required this.child})
      : material = AdaptiveMaterialType.error;

  /// An [AdaptiveMaterial] widget based on the color scheme's background color.
  const AdaptiveMaterial.background({super.key, required this.child})
      : material = AdaptiveMaterialType.background;


  /// An [AdaptiveMaterial] widget based on the color scheme's surface color.
  const AdaptiveMaterial.surface({super.key, required this.child})
      : material = AdaptiveMaterialType.surface;

  /// The [AdaptiveMaterialType] used to style this widget and it's children.
  final AdaptiveMaterialType material;

  /// The widget to draw beneath this.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Color color = material.colorOf(context);
    final Color onColor = material.onColorOf(context);
    final Color secondaryOnColor = material.secondaryOnColorOf(context);
    return Material(
      color: color,
      // TODO(caseycrogers): consider switching to defining the text style in
      //  terms of the color scheme and then set the default text style
      //  accordingly.
      textStyle: TextStyle(color: onColor),
      child: IconTheme(
        data: IconThemeData(
          color: secondaryOnColor,
        ),
        child: child,
      ),
    );
  }
}
