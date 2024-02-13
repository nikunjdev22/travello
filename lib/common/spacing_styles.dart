import 'package:flutter/cupertino.dart';
import '../Utils /sizes.dart';

class TSpacingStyles{
  static const EdgeInsetsGeometry paddingWithAppBarHeight= EdgeInsets.only(
      top: TSizes.appBarHeight,
      left: TSizes.defaultSpace,
      right: TSizes.defaultSpace,
      bottom: TSizes.defaultSpace
  );
}