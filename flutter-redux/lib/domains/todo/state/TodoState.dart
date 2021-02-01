import 'package:flutter_reduxpersist_arch/cores/redux/state.dart';
import 'package:flutter_reduxpersist_arch/domains/todo/models/Todo.dart';
import 'package:meta/meta.dart';

@immutable
class TodoState extends State {
  final List<Todo> todos;

  TodoState({
    @required this.todos
  });

  TodoState copyWith({
    List<Todo> todos
  }) {
    return TodoState(
      todos: todos ?? this.todos
    );
  }

  factory TodoState.initialState() {
    return TodoState(
        todos: []
    );
  }
}