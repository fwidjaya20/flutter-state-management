import 'package:flutter/material.dart';
import 'package:flutter_reduxpersist_arch/cores/colors/CustomColor.dart';
import 'package:flutter_reduxpersist_arch/features/todo/widgets/TodoAppBar.dart';
import 'package:flutter_reduxpersist_arch/features/todo/widgets/TodoListItem.dart';

class TodoListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodoAppbar(),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, left: 20, bottom: 15),
              child: Text(
                'Today',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: CustomColors.TextSubHeader),
              ),
            ),
            TodoListItem(time: '07:00 AM', task: 'Go jogging', isCompleted: true, color: CustomColors.BlueLight),
            Container(
              margin: EdgeInsets.only(top: 15, left: 20, bottom: 15),
              child: Text(
                'Tomorrow',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: CustomColors.TextSubHeader),
              ),
            ),
            TodoListItem(time: '07:00 AM', task: 'Morning Yoga', isCompleted: false, color: CustomColors.GreenLight),
            TodoListItem(time: '08:00 AM', task: 'Review Github Pull Request', isCompleted: false, color: CustomColors.PurpleLight),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColors.PurpleLight,
        child: Icon(Icons.add),
        onPressed: () => this.onFloatingActionButtonTap(context),
      ),
    );
  }

  void onFloatingActionButtonTap(BuildContext context) {
    Navigator.of(context).pushNamed("/todo/add");
  }

}