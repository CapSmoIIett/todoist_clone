import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:todoist_clone/data/repositories/data_base/db_repositories.dart';
import 'package:todoist_clone/data/services/task_list/task_list_service.dart';
import 'package:todoist_clone/ui/home_page/widgets/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => DBProvider),
        Provider(create: (context) => TaskListService(database: context.read()))
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
        home: SafeArea(
          child: HomeScreen(),
        ));
  }
}
