import 'package:flutter_reduxpersist_arch/domains/todo/reducer/TodoReducerV2.dart';
import 'package:flutter_reduxpersist_arch/domains/todo/state/TodoState.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

@immutable
class AppState {
  TodoState todoState;

  AppState({
    this.todoState
  });

  AppState copyWith({
    TodoState todoState
  }) {
    return AppState(
      todoState: todoState ?? this.todoState
    );
  }

  factory AppState.initialState() {
    return AppState(
      todoState: TodoState.initialState()
    );
  }
}

AppState appReducer(AppState state, dynamic action) => AppState(
  todoState: new TodoReducerV2().call(state.todoState, action)
);

Store<AppState> createStore() {
  return Store<AppState>(
    appReducer,
    initialState: AppState.initialState(),
    middleware: []
  );
}

final Store<AppState> AppStore = createStore();
