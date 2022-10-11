
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Gap extends SingleChildRenderObjectWidget {
  const Gap({Key? key, this.size = 16}):super(key: key);

  final double size;

  @override
  RenderGap createRenderObject(BuildContext context) {
    return RenderGap(size);
  }

  @override
  void updateRenderObject(BuildContext context, RenderGap renderObject) {
    renderObject.gapSize = size;
  }

  static const small = Gap(size: 8);
  static const medium = Gap(size: 16);
  static const large = Gap(size: 32);
}

class RenderGap extends RenderBox {
  RenderGap(this._gapSize);

  double _gapSize;
  double get gapSize => _gapSize;
  set gapSize(double gapSize) {
    if (_gapSize != gapSize) {
      _gapSize = gapSize;
      markNeedsLayout();
    }
  }

  @override
  void performLayout() {
    final parent = this.parent;
    if (parent is RenderFlex) {
      if (parent.direction == Axis.horizontal) {
        size = constraints.constrain(Size(_gapSize, 0));
      } else {
        size = constraints.constrain(Size(0, _gapSize));
      }
    } else {
      throw FlutterError('Gap must be used inside a Flex widget');
    }
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    final parent = this.parent;
    if (parent is RenderFlex && parent.direction == Axis.horizontal) {
      return gapSize;
    }
    return super.computeMinIntrinsicWidth(height);
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    return computeMinIntrinsicWidth(height);
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    final parent = this.parent;
    if (parent is RenderFlex && parent.direction == Axis.vertical) {
      return gapSize;
    }
    return super.computeMinIntrinsicHeight(width);
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    return computeMaxIntrinsicHeight(width);
  }
}