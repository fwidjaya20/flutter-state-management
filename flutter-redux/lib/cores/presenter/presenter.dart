import 'package:flutter_reduxpersist_arch/cores/redux/action.dart';
import 'package:flutter_reduxpersist_arch/store.dart';
import 'package:redux/redux.dart';

abstract class Presenter {
  Store<AppState> _store;

  Presenter(this._store);

  AppState get state => this._store.state;

  void dispatch(Action action) {
    this._store.dispatch(action);
  }
}