import 'package:flutter/material.dart';

class TaskInformation {
  final String id;
  final String firstName;
  final String lastName;
  final DateTime birthday;
  TaskInformation({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthday,
  });
}
