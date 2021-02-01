import 'package:flutter_reduxpersist_arch/cores/redux/action.dart';
import 'package:flutter_reduxpersist_arch/domains/todo/actions/ActionV2.dart';
import 'package:flutter_reduxpersist_arch/domains/todo/models/Todo.dart';

class AppendTodoAction extends Action {
  AppendTodoAction(Todo payload): super(
    type: TodoAction.SET_TODO_LIST,
    payload: payload
  );
}
