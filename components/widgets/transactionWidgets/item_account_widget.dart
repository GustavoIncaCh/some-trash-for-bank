
import 'package:bank9780/modules/general/classes.dart';
import 'package:bank9780/properties/skin.dart';

import 'package:flutter/material.dart';

class ItemAccountWidget extends StatelessWidget {

  final Account account;

  ///  Single account information box
  ///-----------------------------------------------------
  ///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
  ///  - email: 9780desarrollador09@gmail.com
  ///  - Date : 02/12/2021
  const ItemAccountWidget({
    required this.account,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding : const EdgeInsets.symmetric(horizontal: 7),
      child   :
      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(account.bank, style: Skin.dropdownItemTextStyle()),
                const SizedBox(height: 2),
                Text(account.name, style: Skin.dropdownItemTextStyle()),
              ]
            )
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(account.number, style: Skin.dropdownItemTextStyle()),
                const SizedBox(height: 2),
                Text(account.interbank, style: Skin.dropdownItemTextStyle()),
              ]
            )
          )
        ]
      )
    );
  }

  String cutText(String text) => text.length > 38 ? text = text.substring(0, 18) + ('...') + text.substring(text.length - 19, text.length) : text;
}