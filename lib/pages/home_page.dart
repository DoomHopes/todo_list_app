import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/widgets/drawer_widget.dart';
import 'package:todo_list_app/widgets/works_list_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo'),
      ),
      drawer: DrawerWidget(),
      body: WorksListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // add new work
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.adjust),
            label: 'List of my cases',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search for my cases',
          ),
        ],
        onTap: (value) {
          // do something
        },
      ),
    );
  }
}
