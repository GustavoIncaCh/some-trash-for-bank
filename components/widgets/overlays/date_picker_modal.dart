import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onClicked;


  const ButtonWidget({Key? key, required this.onClicked,}) : super(key: key);

  @override
  Widget build(BuildContext context) => TextButton(
    style : ElevatedButton.styleFrom(minimumSize: const Size(80, 40)),
    child : Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text('Show Picker',
          style: TextStyle(
            fontSize : 20,
            color    : Colors.black
          ),
        ),
        SizedBox(width: 8),
        Icon(Icons.date_range,
          size  : 28,
          color : Color(0xFF1A477C),
        ),
      ],
    ),
    onPressed: onClicked,
  );

  static void buildDatePicker(onClicked) {}
}