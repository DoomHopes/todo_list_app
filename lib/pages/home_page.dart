import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/widgets/drawer_widget.dart';
import 'package:todo_list_app/widgets/search_widget.dart';
import 'package:todo_list_app/widgets/works_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo'),
      ),
      drawer: DrawerWidget(),
      body: sectionIndex == 0 ? WorksListWidget() : SearchWidget(),
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
        currentIndex: sectionIndex,
        onTap: (int value) {
          setState(() {
            sectionIndex = value;
          });
        },
      ),
    );
  }
}
