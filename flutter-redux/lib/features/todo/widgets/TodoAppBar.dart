import 'package:flutter/material.dart';
import 'package:flutter_reduxpersist_arch/cores/colors/CustomColor.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

const double SIZE_HEIGHT = 80.0;

class TodoAppbar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(SIZE_HEIGHT),
      child: GradientAppBar(
        automaticallyImplyLeading: false,
        title: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hello Fredrick!',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
              Text(
                'Today you have 9 tasks',
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        elevation: 0,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CustomColors.HeaderBlueDark, CustomColors.HeaderBlueLight
          ]
        ),
      ),
    );
  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(SIZE_HEIGHT);

}
