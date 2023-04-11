import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationModel {
  final String route;
  final StatelessWidget screen;
  final Bindings? bindings;

  const NavigationModel({
    required this.route,
    required this.screen,
    this.bindings,
  });
}
