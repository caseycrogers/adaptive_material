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
    this.shouldDraw = true,
  }) : super(key: key);

  /// An [AdaptiveMaterial] widget based on the color scheme's primary color.
  const AdaptiveMaterial.primary({super.key, required this.child})
      : shouldDraw = true,
        material = AdaptiveMaterialType.primary;

  /// An [AdaptiveMaterial] widget based on the color scheme's secondary color.
  const AdaptiveMaterial.secondary({super.key, required this.child})
      : shouldDraw = true,
        material = AdaptiveMaterialType.secondary;

  /// An [AdaptiveMaterial] widget based on the color scheme's error color.
  const AdaptiveMaterial.error({super.key, required this.child})
      : shouldDraw = true,
        material = AdaptiveMaterialType.error;

  /// An [AdaptiveMaterial] widget based on the color scheme's background color.
  const AdaptiveMaterial.background({super.key, required this.child})
      : shouldDraw = true,
        material = AdaptiveMaterialType.background;

  /// An [AdaptiveMaterial] widget based on the color scheme's surface color.
  const AdaptiveMaterial.surface({super.key, required this.child})
      : shouldDraw = true,
        material = AdaptiveMaterialType.surface;

  /// The [AdaptiveMaterialType] used to style this widget and it's children.
  final AdaptiveMaterialType material;

  /// The widget to draw beneath this.
  final Widget child;

  /// Whether or not to draw a background color behind [child].
  ///
  /// This is useful for manually specifying the background of child widgets
  /// according to the [AdaptiveMaterial] without drawing anything behind them.
  final bool shouldDraw;

  /// The material type of the nearest enclosing adaptive material widget.
  static AdaptiveMaterialType? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedMaterialType>()
        ?.adaptiveMaterialType;
  }

  /// The default background color according to the nearest enclosing adaptive
  /// material widget.
  static Color? colorOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedMaterialType>()
        ?.adaptiveMaterialType
        .colorOf(context);
  }

  /// The default foreground element color according to the nearest enclosing
  /// adaptive material widget.
  static Color? onColorOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedMaterialType>()
        ?.adaptiveMaterialType
        .onColorOf(context);
  }

  /// The default secondary foreground element (icons) color according to the
  /// nearest enclosing adaptive material widget.
  static Color? secondaryOnColorOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedMaterialType>()
        ?.adaptiveMaterialType
        .secondaryOnColorOf(context);
  }

  @override
  Widget build(BuildContext context) {
    final Color color = material.colorOf(context);
    final Color onColor = material.onColorOf(context);
    final Color secondaryOnColor = material.secondaryOnColorOf(context);
    final Widget themedChild = DefaultTextStyle(
      style: TextStyle(color: onColor),
      child: IconTheme(
        data: IconThemeData(
          color: secondaryOnColor,
        ),
        child: _InheritedMaterialType(
          adaptiveMaterialType: material,
          child: child,
        ),
      ),
    );
    if (shouldDraw) {
      return Material(
        color: color,
        child: themedChild,
      );
    }
    return themedChild;
  }
}

class _InheritedMaterialType extends InheritedWidget {
  const _InheritedMaterialType({
    Key? key,
    required this.adaptiveMaterialType,
    required Widget child,
  }) : super(key: key, child: child);

  final AdaptiveMaterialType adaptiveMaterialType;

  @override
  bool updateShouldNotify(_InheritedMaterialType old) {
    return old.adaptiveMaterialType != adaptiveMaterialType;
  }
}
