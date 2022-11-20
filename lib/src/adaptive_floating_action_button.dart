import 'package:adaptive_material/adaptive_material.dart';
import 'package:flutter/material.dart';

class AdaptiveFloatingActionButton extends StatelessWidget {
  const AdaptiveFloatingActionButton({
    super.key,
    this.material = AdaptiveMaterialType.secondary,
    this.child,
    this.tooltip,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.heroTag = const _DefaultHeroTag(),
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    required this.onPressed,
    this.mouseCursor,
    this.mini = false,
    this.shape,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.materialTapTargetSize,
    this.isExtended = false,
    this.enableFeedback,
  })  : _floatingActionButtonType = mini
            ? _FloatingActionButtonType.small
            : _FloatingActionButtonType.regular,
        extendedIconLabelSpacing = null,
        extendedPadding = null,
        extendedTextStyle = null;

  const AdaptiveFloatingActionButton.small({
    super.key,
    this.material = AdaptiveMaterialType.secondary,
    this.child,
    this.tooltip,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.heroTag = const _DefaultHeroTag(),
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    required this.onPressed,
    this.mouseCursor,
    this.shape,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.materialTapTargetSize,
    this.enableFeedback,
  })  : _floatingActionButtonType = _FloatingActionButtonType.small,
        mini = true,
        isExtended = false,
        extendedIconLabelSpacing = null,
        extendedPadding = null,
        extendedTextStyle = null;

  const AdaptiveFloatingActionButton.large({
    super.key,
    this.material = AdaptiveMaterialType.secondary,
    this.child,
    this.tooltip,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.heroTag = const _DefaultHeroTag(),
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    required this.onPressed,
    this.mouseCursor,
    this.shape,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.materialTapTargetSize,
    this.enableFeedback,
  })  : _floatingActionButtonType = _FloatingActionButtonType.large,
        mini = false,
        isExtended = false,
        extendedIconLabelSpacing = null,
        extendedPadding = null,
        extendedTextStyle = null;

  final AdaptiveMaterialType material;

  final Widget? child;
  final String? tooltip;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? splashColor;
  final Object? heroTag;
  final VoidCallback? onPressed;
  final MouseCursor? mouseCursor;
  final double? elevation;
  final double? focusElevation;
  final double? hoverElevation;
  final double? highlightElevation;
  final double? disabledElevation;
  final bool mini;
  final ShapeBorder? shape;
  final Clip clipBehavior;
  final bool isExtended;
  final FocusNode? focusNode;
  final bool autofocus;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool? enableFeedback;
  final double? extendedIconLabelSpacing;
  final EdgeInsetsGeometry? extendedPadding;
  final TextStyle? extendedTextStyle;

  final _FloatingActionButtonType _floatingActionButtonType;

  @override
  Widget build(BuildContext context) {
    final Color color = material.colorOf(context);
    final Color onColor = material.onColorOf(context);
    switch (_floatingActionButtonType) {
      case _FloatingActionButtonType.regular:
        return FloatingActionButton(
          key: key,
          tooltip: tooltip,
          foregroundColor: onColor,
          backgroundColor: color,
          focusColor: focusColor,
          hoverColor: hoverColor,
          splashColor: splashColor,
          heroTag: heroTag,
          elevation: elevation,
          focusElevation: focusElevation,
          hoverElevation: hoverElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          onPressed: onPressed,
          mouseCursor: mouseCursor,
          mini: mini,
          shape: shape,
          clipBehavior: clipBehavior,
          focusNode: focusNode,
          autofocus: autofocus,
          materialTapTargetSize: materialTapTargetSize,
          isExtended: isExtended,
          enableFeedback: enableFeedback,
          child: child,
        );
      case _FloatingActionButtonType.small:
        return FloatingActionButton.small(
          key: key,
          tooltip: tooltip,
          foregroundColor: color,
          backgroundColor: onColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          splashColor: splashColor,
          heroTag: heroTag,
          elevation: elevation,
          focusElevation: focusElevation,
          hoverElevation: hoverElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          onPressed: onPressed,
          mouseCursor: mouseCursor,
          shape: shape,
          clipBehavior: clipBehavior,
          focusNode: focusNode,
          autofocus: autofocus,
          materialTapTargetSize: materialTapTargetSize,
          enableFeedback: enableFeedback,
          child: child,
        );
      case _FloatingActionButtonType.large:
        return FloatingActionButton.large(
          key: key,
          tooltip: tooltip,
          foregroundColor: color,
          backgroundColor: onColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          splashColor: splashColor,
          heroTag: heroTag,
          elevation: elevation,
          focusElevation: focusElevation,
          hoverElevation: hoverElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          onPressed: onPressed,
          mouseCursor: mouseCursor,
          shape: shape,
          clipBehavior: clipBehavior,
          focusNode: focusNode,
          autofocus: autofocus,
          materialTapTargetSize: materialTapTargetSize,
          enableFeedback: enableFeedback,
          child: child,
        );
    }
  }
}

class _DefaultHeroTag {
  const _DefaultHeroTag();

  @override
  String toString() => '<default FloatingActionButton tag>';
}

enum _FloatingActionButtonType {
  regular,
  small,
  large,
}
