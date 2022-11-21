import 'package:adaptive_material/adaptive_material.dart';
import 'package:flutter/material.dart';

/// The material type to use for an [AdaptiveMaterial] widget.
///
/// Each entry corresponds to a `<value>`, `on<Value>` pair of attributes in
/// [ColorScheme].
///
/// TODO(caseycrogers): Add values for the remaining eligible attribute pairs.
enum AdaptiveMaterialType {
  primary,
  secondary,
  error,
  background,
  surface,
}

extension TypeHelpers on AdaptiveMaterialType {
  /// Converts this material type to the corresponding color from the scheme
  /// provided in the given context.
  ///
  /// This color is used by `AdaptiveMaterial` to draw the background surface.
  Color colorOf(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    switch (this) {
      case AdaptiveMaterialType.primary:
        return colorScheme.primary;
      case AdaptiveMaterialType.secondary:
        return colorScheme.secondary;
      case AdaptiveMaterialType.error:
        return colorScheme.error;
      case AdaptiveMaterialType.background:
        return colorScheme.background;
      case AdaptiveMaterialType.surface:
        return colorScheme.surface;
    }
  }

  /// Converts this material type to the corresponding on color from the scheme
  /// provided in the given context.
  ///
  /// This color is used by `AdaptiveMaterial` to style all text widgets below
  /// it.
  Color onColorOf(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    switch (this) {
      case AdaptiveMaterialType.primary:
        return colorScheme.onPrimary;
      case AdaptiveMaterialType.secondary:
        return colorScheme.onSecondary;
      case AdaptiveMaterialType.error:
        return colorScheme.onError;
      case AdaptiveMaterialType.background:
        return colorScheme.onBackground;
      case AdaptiveMaterialType.surface:
        return colorScheme.onSurface;
    }
  }

  /// Converts this material type to the corresponding secondary on color from
  /// the scheme provided in the given context.
  ///
  /// This color is used by `AdaptiveMaterial` to style all icons below it.
  Color secondaryOnColorOf(BuildContext context) {
    // TODO(caseycrogers): create an extension of `ColorScheme` that allows
    //  developers to explicitly set their `secondaryOnColor`.
    return Color.lerp(colorOf(context), onColorOf(context), .65)!;
  }
}
