import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Todo {
  final String task;
  final DateTime schedule;
  final Color color;

  Todo({
    @required this.task,
    @required this.schedule,
    @required this.color
  });
}