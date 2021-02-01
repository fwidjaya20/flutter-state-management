import 'package:flutter_reduxpersist_arch/cores/presenter/presenter.dart';
import 'package:flutter_reduxpersist_arch/domains/todo/actions/AppendTodoAction.dart';
import 'package:flutter_reduxpersist_arch/domains/todo/models/Todo.dart';
import 'package:flutter_reduxpersist_arch/store.dart';

class TodoPresenter extends Presenter {

  TodoPresenter() : super(AppStore);

  Future<void> createTodo(Todo dto) async {
    this.dispatch(AppendTodoAction(dto));
    return;
  }

}