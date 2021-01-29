import 'package:flutter/material.dart';
import 'package:flutter_reduxpersist_arch/cores/colors/CustomColor.dart';
import 'package:meta/meta.dart';

class TodoListItem extends StatelessWidget {
  final String time;
  final String task;
  final bool isCompleted;
  final Color color;

  TodoListItem({
    @required this.time,
    @required this.task,
    @required this.isCompleted,
    @required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 15),
      padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            this.time ?? '00:00 AM',
            style: TextStyle(color: CustomColors.TextGrey),
          ),
          Container(
            width: 180,
            child: Text(
              this.task ?? '-',
              style: TextStyle(
                color: this.isCompleted ? CustomColors.TextGrey : CustomColors.TextHeader,
                fontWeight: this.isCompleted ? FontWeight.normal : FontWeight.w600,
                decoration: this.isCompleted ? TextDecoration.lineThrough : TextDecoration.none
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [0.015, 0.015],
          colors: [this.color, Colors.white],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        boxShadow: [
          BoxShadow(
            color: CustomColors.GreyBorder,
            blurRadius: 10.0,
            spreadRadius: 5.0,
            offset: Offset(0.0, 0.0),
          ),
        ],
      ),
    );
  }

}