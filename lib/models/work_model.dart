import 'package:cloud_firestore/cloud_firestore.dart';

class WorkModel {
  String id;
  String name;
  String description;
  String level;
  Timestamp createdDate;
  Timestamp dateOfCompletion;

  WorkModel({
    this.id,
    this.name,
    this.description,
    this.level,
    this.createdDate,
    this.dateOfCompletion,
  });
}
