import 'package:flutter/material.dart';

enum NavigationItem {
  home,
  upcoming,
  inbox
}

class NavigationModel {
  final NavigationItem item;
  final String title;
  final IconData icon;

  const NavigationModel({
    required this.item,
    required this.title,
    required this.icon,
  });
} 