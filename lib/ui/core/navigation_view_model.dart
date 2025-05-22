import 'package:flutter/material.dart';
import '../models/navigation_model.dart';

class NavigationViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  
  final List<NavigationModel> navigationItems = [
    NavigationModel(
      item: NavigationItem.home,
      title: 'Home',
      icon: Icons.home,
    ),
    NavigationModel(
      item: NavigationItem.upcoming,
      title: 'Upcoming',
      icon: Icons.calendar_today,
    ),
    NavigationModel(
      item: NavigationItem.inbox,
      title: 'Inbox',
      icon: Icons.inbox,
    ),
  ];

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
} 