import 'package:flutter/material.dart';
import 'package:todo_list_app/models/work_model.dart';

class GridViewWidget extends StatefulWidget {
  final List<WorkModel> works;

  GridViewWidget({this.works});

  @override
  _GridViewWidgetState createState() => _GridViewWidgetState(works: works);
}

class _GridViewWidgetState extends State<GridViewWidget> {
  final List<WorkModel> works;

  _GridViewWidgetState({this.works});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
        childAspectRatio: 1.5,
      ),
      itemCount: works.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(works[index].name),
              Container(
                height: 100,
                width: 100,
                child: ListView.builder(
                  itemCount: works[index].fields.length,
                  itemBuilder: (context, fieldIndex) {
                    return Column(
                      children: <Widget>[
                        Text(works[index].fields[fieldIndex].name),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
