import 'package:flutter/material.dart';
import 'package:todoist_clone/ui/core/ui/task_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final Map<int, List<Widget>> _defaulButtons = {
    0: [Icon(Icons.inbox, color: Colors.blue), Text('Inbox')],
    1: [Icon(Icons.calendar_today, color: Colors.green), Text('Today')],
    2: [Icon(Icons.calendar_month, color: Colors.purple), Text('Upcoming')],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.add_alert,
                  color: Colors.white,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {})
          ],
        ),
        body: ListView.separated(
          itemCount: _defaulButtons.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Container(
                height: 30,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: _defaulButtons[index]!,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TaskList()));
              },
            );
          },
          separatorBuilder: (context, index) => Divider(
            thickness: 0.1,
          ),
        ));
  }
}
