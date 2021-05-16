import 'package:intl/intl.dart';

class TodoModelClass {
  final String title;
  final String description;
  final DateTime dateTime;
  final bool doneState;
  final DateFormat dateFormat;

  TodoModelClass({
    this.title,
    this.description,
    this.dateTime,
    this.dateFormat,
    this.doneState = false,
  });

}
