import 'package:flutter_reduxpersist_arch/cores/redux/reducer.dart';
import 'package:flutter_reduxpersist_arch/domains/todo/actions/ActionV2.dart';
import 'package:flutter_reduxpersist_arch/domains/todo/models/Todo.dart';
import 'package:flutter_reduxpersist_arch/domains/todo/state/TodoState.dart';

class TodoReducerV2 extends Reducer<TodoState> {
  TodoReducerV2() : super(
    TodoState.initialState()
  );

  TodoState appendTodo(TodoState state, Todo payload) {
    return state.copyWith(
      todos: [...state.todos, payload]
    );
  }

  @override
  Map<String, Function> get actions => {
    TodoAction.SET_TODO_LIST: this.appendTodo
  };
}