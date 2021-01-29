import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxpersist_arch/cores/colors/CustomColor.dart';
import 'package:flutter_reduxpersist_arch/cores/constants/icon.dart';
import 'package:flutter_reduxpersist_arch/domains/todo/models/Todo.dart';
import 'package:flutter_reduxpersist_arch/domains/todo/state/TodoState.dart';
import 'package:flutter_reduxpersist_arch/features/todo/widgets/TodoListItem.dart';
import 'package:flutter_reduxpersist_arch/store.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';

class TodoListView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TodoState>(
      converter: (Store<AppState> store) => store.state.todoState,
      builder: (BuildContext context, TodoState state) {
        if (state.todos.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(IconPath.CLIPBOARD_EMPTY),
                SizedBox(height: 22.0),
                Text(
                  'No tasks',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.TextHeader
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'You have no tasks to do.',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.TextBody,
                    fontFamily: 'opensans'
                  ),
                ),
              ],
            ),
          );
        }
        
        return ListView.builder(
          padding: EdgeInsets.only(top: 16.0),
          scrollDirection: Axis.vertical,
          itemCount: state.todos.length,
          itemBuilder: (BuildContext context, int index) {
            final Todo todo = state.todos.elementAt(index);

            return TodoListItem(
              time: new DateFormat('E, dd MMM y hh:mm a').format(todo.schedule),
              task: todo.task,
              isCompleted: false,
              color: todo.color
            );
          }
        );
      },
    );
  }
  
}