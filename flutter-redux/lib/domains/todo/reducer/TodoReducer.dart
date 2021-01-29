import 'package:flutter_reduxpersist_arch/domains/todo/actions/SetTodoListAction.dart';
import 'package:flutter_reduxpersist_arch/domains/todo/state/TodoState.dart';
import 'package:redux/redux.dart';

final todoReducer = combineReducers<TodoState>([
  TypedReducer<TodoState, SetTodoAction>(_setTodoList)
]);

TodoState _setTodoList(TodoState state, SetTodoAction action) => state.copyWith(
  todos: [...state.todos, action.todo]
);
