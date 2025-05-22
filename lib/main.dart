import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoist_clone/data/repositories/data_base/db_repositories.dart';
import 'package:todoist_clone/data/services/task_list/task_list_service.dart';
import 'package:todoist_clone/ui/core/navigation_view_model.dart';
import 'package:todoist_clone/ui/core/navigation_screen.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  // Инициализация SQLite для Windows
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => DBProvider),
        Provider(create: (context) => TaskListService(database: context.read())),
        ChangeNotifierProvider(create: (context) => NavigationViewModel()),
      ],
      child: MainApp()
    )
  );
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SafeArea(
        child: NavigationScreen(),
      ),
    );
  }
}
