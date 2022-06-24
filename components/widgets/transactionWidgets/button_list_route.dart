import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:bank9780/modules/general/button_class.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';

// ignore: implementation_imports

// import the class: button_class
// create the list of the items and the actions of the dropbutton
DateFormat dateFormat = DateFormat("dd-MM-yyyy");

class ButtonListRoute extends StatefulWidget {
  final String buttonName;
  final List<ItemMenu> menuListItems;
  final VoidCallback? onClicked;
  //final String? selectedValue;
  //final ItemMenus menuAA;
  const ButtonListRoute(
      {required this.buttonName,
      required this.menuListItems,
      this.onClicked,
      //this.selectedValue,
      //required this.menuAA,
      Key? key})
      : super(key: key);

  @override
  State<ButtonListRoute> createState() => _ButtonListRouteState();
}

class _ButtonListRouteState extends State<ButtonListRoute> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) => DropdownButtonHideUnderline(
        child: DropdownButton2(
          buttonDecoration: BoxDecoration(
            color: const Color(0xFF1A477C),
            borderRadius: BorderRadius.circular(4),
          ),
          dropdownDecoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)),
            border: Border(),
          ),
          isExpanded: true,
          //scrollbarThickness: 6,
          iconEnabledColor: Colors.white,
          buttonPadding: const EdgeInsets.only(right: 14, left: 14),
          disabledHint: null,
          //autofocus: false,
          hint: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.buttonName!=context.read<ItemMenus>().hintName? widget.buttonName : context.watch<ItemMenus>().hintName,
              // to change the name of the button
              // context.watch<ItemMenus>().hintName,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          dropdownElevation: 4,
          items: widget.menuListItems
              .map(
                (item) => DropdownMenuItem<ItemMenu>(
                  value: item,
                  child: Text(
                    item.text,
                    style: const TextStyle(
                        backgroundColor: Colors.transparent,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ),
              )
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            context.read<ItemMenus>().onChanged(context, value as ItemMenu);
          },
    
          selectedItemBuilder: (BuildContext context) => widget.menuListItems
              .map(
                (e) => Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    e.text,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
              .toList(),
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
    );
  }
}