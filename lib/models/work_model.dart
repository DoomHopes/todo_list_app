import 'package:cloud_firestore/cloud_firestore.dart';

class WorkModel {
  String name;
  String description;
  String level;
  Timestamp createdDate;

  WorkModel({this.name, this.description, this.level, this.createdDate});
}
