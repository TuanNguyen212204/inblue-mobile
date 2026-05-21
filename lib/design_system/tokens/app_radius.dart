import 'package:flutter/material.dart';

abstract final class AppRadius {
  static const double sm = 8;
  static const double md = 10; // web --radius ≈ 0.625rem
  static const double lg = 12; // cards

  static final BorderRadius button = BorderRadius.circular(md);
  static final BorderRadius card = BorderRadius.circular(lg);
}
