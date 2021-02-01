import 'package:flutter_reduxpersist_arch/cores/redux/action.dart';
import 'package:flutter_reduxpersist_arch/cores/redux/state.dart';
import 'package:redux/redux.dart' as Redux;

abstract class Reducer<T extends State> implements Redux.ReducerClass<T> {
  final T initialState;

  Reducer(this.initialState);

  Map<String, Function> get actions;

  @override
  T call(T state, action) {

    if (action is Action) {
      return this.actions[action.type](state, action.payload);
    }

    return state;
  }
}
