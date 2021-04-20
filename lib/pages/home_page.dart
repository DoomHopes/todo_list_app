import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/services/auth.dart';
import 'package:todo_list_app/services/home_provider.dart';
import 'package:todo_list_app/utils/constants.dart';
import 'package:todo_list_app/widgets/add_widget.dart';
import 'package:todo_list_app/widgets/works_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sectionIndex = 0;

  AuthService _service = AuthService();

  // nav bar
  ShapeBorder bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;

  // Filter
  String _filterLevel = '';
  String _filterTitle = '';
  String _filterText = 'Filter';
  double _filterHeight = 0.0;

  TextEditingController _filterTextController;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getworkFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    /// snakeNavigationBar
    var _snakeNavigationBar = SnakeNavigationBar.color(
      behaviour: snakeBarStyle,
      shape: bottomBarShape,
      padding: const EdgeInsets.all(10),
      currentIndex: sectionIndex,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      onTap: (index) => setState(() => sectionIndex = index),
      items: [
        const BottomNavigationBarItem(
            icon: Icon(Icons.adjust), label: 'List of my cases'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.add), label: 'Add new cases'),
      ],
    );

    /// Filter
    var _filterButton = Container(
      margin: EdgeInsets.only(top: 3, left: 7, right: 7, bottom: 5),
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _filterHeight = (_filterHeight == 0.0 ? 200.0 : 0.0);
          });
        },
        child: Row(
          children: <Widget>[
            Icon(Icons.filter_list),
            Text(_filterText),
          ],
        ),
      ),
    );

    var _filterForm = AnimatedContainer(
      height: _filterHeight,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(microseconds: 400),
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 7),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              DropdownButtonFormField<String>(
                onChanged: (String val) {
                  setState(() {
                    _filterLevel = val;
                  });
                },
                items: kListItemForFilter,
                decoration: const InputDecoration(labelText: 'Level'),
              ),
              TextFormField(
                controller: _filterTextController,
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  setState(() {
                    _filterTitle = value;
                  });
                },
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Apply function
                      },
                      child: Text('Apply'),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Clear function
                      },
                      child: Text('Clear'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );

    return Consumer<HomeProvider>(
      builder: (context, providerData, child) => Scaffold(
        appBar: AppBar(
          title: const Text('ToDo'),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10, right: 20, bottom: 10),
              child: ElevatedButton(
                child: Icon(Icons.exit_to_app_rounded),
                onPressed: () {
                  _service.logOut();
                },
              ),
            ),
          ],
        ),
        body: sectionIndex == 0
            ? Column(
                children: <Widget>[
                  _filterButton,
                  _filterForm,
                  WorksListWidget(
                    works: providerData.works,
                  ),
                ],
              )
            : AddWidget(),
        bottomNavigationBar: _snakeNavigationBar,
      ),
    );
  }
}
