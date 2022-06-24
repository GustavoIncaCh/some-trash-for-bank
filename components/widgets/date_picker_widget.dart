import 'package:bank9780/components/widgets/overlays/date_picker_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({ Key? key }) : super(key: key);

  static void showSheet(
    BuildContext context, {
    required Widget child,
    required VoidCallback onClicked,
  }) =>
      showCupertinoModalPopup(
        context   : context,
        builder   : (context) => CupertinoActionSheet(
          actions : [
            child,
          ],
          cancelButton: CupertinoActionSheetAction(
            child     : const Text('Hecho'),
            onPressed : onClicked,
          ),
        ),
      );

  static void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text, style: const TextStyle(fontSize: 24)),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //buildDatePicker(),
        //const SizedBox(height: 20),
        // calls button method //
        ButtonWidget(
          onClicked: () => DatePicker.showSheet(
            context,
            child: buildDatePicker(),
            onClicked: (){
              Navigator.pop(context);
            },
          )
        )
      ],
    );
  }
  Widget buildDatePicker() => SizedBox(
    height : 180,
    child  : CupertinoDatePicker(
      minimumYear       : 2022,
      maximumYear       : DateTime.now().year,
      initialDateTime   : dateTime,
      mode              : CupertinoDatePickerMode.date,
      onDateTimeChanged : (dateTime) => setState (() => this.dateTime = dateTime),
    ),
  );
}