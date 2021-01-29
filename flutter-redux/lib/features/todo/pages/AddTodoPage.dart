import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reduxpersist_arch/cores/colors/CustomColor.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ColorOption {
  final String label;
  final Color value;

  ColorOption(this.label, this.value);
}

class AddTodoPage extends StatefulWidget {
  final List<ColorOption> availableColors = [
    ColorOption("Green", CustomColors.GreenLight),
    ColorOption("Purple", CustomColors.PurpleLight),
    ColorOption("Yellow", CustomColors.YellowIcon),
    ColorOption("Blue", CustomColors.BlueLight),
  ];

  @override
  State<StatefulWidget> createState() {
    return _AddTodoPageState();
  }
}

class _AddTodoPageState extends State<AddTodoPage> {
  static const String F = "";

  TextEditingController _taskTitleController;
  TextEditingController _taskScheduleController;

  ColorOption _selectedColor;

  @override
  void initState() {
    super.initState();
    this._taskTitleController = TextEditingController();
    this._taskScheduleController = TextEditingController();
    this._selectedColor = null;
  }

  @override
  void dispose() {
    this._taskTitleController.dispose();
    this._taskScheduleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text("Add Your Todo Task"),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CustomColors.HeaderBlueDark,
            CustomColors.HeaderBlueLight,
          ]
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 16.0
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: this._taskTitleController,
              style: TextStyle(
                color: CustomColors.TextHeaderGrey,
                fontSize: 12.0,
                fontWeight: FontWeight.w600
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 16.0
                ),
                hintText: "Input the Task Name",
                hintStyle: TextStyle(
                  color: CustomColors.TextSubHeaderGrey
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: CustomColors.GreyBorder,
                    width: 1.0
                  ),
                  borderRadius: BorderRadius.circular(4.0)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: CustomColors.HeaderBlueDark,
                    width: 1.0
                  ),
                  borderRadius: BorderRadius.circular(4.0)
                ),
                labelText: "Task Name",
                labelStyle: TextStyle(
                  color: CustomColors.TextSubHeaderGrey,
                  fontSize: 14.0
                )
              ),
            ),
            SizedBox(height: 8.0),
            InkWell(
              onTap: this.onTapTimePicker,
              child: TextFormField(
                controller: this._taskScheduleController,
                enabled: false,
                readOnly: true,
                style: TextStyle(
                  color: CustomColors.TextHeaderGrey,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 16.0
                  ),
                  hintText: "Schedule your Task",
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CustomColors.GreyBorder,
                      width: 1.0
                    ),
                    borderRadius: BorderRadius.circular(4.0)
                  ),
                  labelText: "Schedule your Task",
                  labelStyle: TextStyle(
                    fontSize: 14.0
                  )
                )
              ),
            ),
            SizedBox(height: 8.0),
            ChipsChoice<ColorOption>.single(
              value: this._selectedColor,
              onChanged: this.onChipColorChange,
              choiceItems: C2Choice.listFrom<ColorOption, ColorOption>(
                source: widget.availableColors,
                value: (_, v) => v,
                label: (_, v) => v.label
              ),
              choiceActiveStyle: C2ChoiceStyle(
                color: this._selectedColor?.value ?? CustomColors.GreyBorder
              ),
              padding: EdgeInsets.all(0.0),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          child: Text("ADD TODO", style: TextStyle(
            color: CustomColors.TextWhite,
            fontWeight: FontWeight.w500
          )),
          color: CustomColors.HeaderBlueDark,
          onPressed: this.onAddTodo,
        ),
      ),
    );
  }

  void onAddTodo() {
    var formData = {
      "task": this._taskTitleController.text,
      "schedule": this._taskScheduleController.text,
      "color": this._selectedColor.value
    };

    print(formData);
  }

  void onTapTimePicker() async {
    DateTime initialDate = new DateTime.now();
    int YEAR = initialDate.year;

    if (this._taskScheduleController.text.isNotEmpty) {
      initialDate = DateTime.tryParse(this._taskScheduleController.text);
    }

    DateTime resultDate = null;
    TimeOfDay resultTime = null;

    resultDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(YEAR, 1, 1),
      lastDate: DateTime.now()
    );

    if (resultDate != null) {
      resultTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now()
      );
    }

    if (resultDate != null && resultTime != null) {
      this._taskScheduleController.text = new DateTime(resultDate.year, resultDate.month, resultDate.day, resultTime.hour, resultTime.minute).toIso8601String();
    }
  }

  void onChipColorChange(ColorOption opt) {
    setState(() {
      this._selectedColor = opt;
    });
  }

}