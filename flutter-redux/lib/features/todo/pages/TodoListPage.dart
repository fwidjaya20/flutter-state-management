import 'package:flutter/material.dart';
import 'package:flutter_reduxpersist_arch/cores/colors/CustomColor.dart';
import 'package:flutter_reduxpersist_arch/features/todo/widgets/TodoAppBar.dart';
import 'package:flutter_reduxpersist_arch/features/todo/widgets/TodoListView.dart';

class TodoListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodoAppbar(),
      body: TodoListView(),
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