import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/task_information.dart';

class TaskInformationList extends StatelessWidget {
  final List<TaskInformation> taskInformations;

  TaskInformationList(this.taskInformations);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${taskInformations[index].id}'),
                  Text('First Name: ${taskInformations[index].firstName}'),
                  Text('Last Name: ${taskInformations[index].lastName}'),
                  Text(
                    DateFormat.yMMMd().format(taskInformations[index].birthday),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: taskInformations.length,
      ),
    );
  }
}
