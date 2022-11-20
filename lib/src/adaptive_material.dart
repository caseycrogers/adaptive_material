import 'package:adaptive_material/src/adaptive_material_type.dart';
import 'package:flutter/material.dart';

class AdaptiveMaterial extends StatelessWidget {
  const AdaptiveMaterial({
    Key? key,
    required this.materialType,
    required this.child,
  }) : super(key: key);

  final AdaptiveMaterialType materialType;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: materialType.colorOf(context),
      child: child,
    );
  }
}
