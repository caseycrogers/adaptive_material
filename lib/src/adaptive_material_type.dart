import 'package:flutter/material.dart';

enum AdaptiveMaterialType {
  primary,
  secondary,
  error,
  background,
  surface,
}

extension TypeHelpers on AdaptiveMaterialType {
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
}
