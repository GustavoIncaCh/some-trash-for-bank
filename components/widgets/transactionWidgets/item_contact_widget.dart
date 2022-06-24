
import 'package:bank9780/modules/general/classes.dart';
import 'package:bank9780/properties/skin.dart';

import 'package:flutter/material.dart';

class ItemContactWidget extends StatelessWidget {

  final Contact contact;

  ///  Single contact information box
  ///-----------------------------------------------------
  ///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
  ///  - email: 9780desarrollador09@gmail.com
  ///  - Date : 02/12/2021
  const ItemContactWidget({
    required this.contact,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 90,
      // padding : const EdgeInsets.symmetric(horizontal: 7),
      child   :
      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child       : Image.asset(contact.photo, width: 30, height: 30),
          ),
          const SizedBox(width: 10),
          Expanded(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  contact.name,
                  style     : Skin.dropdownItemTextStyle(),
                  maxLines  : 1,
                  overflow  : TextOverflow.clip,
                ),
                const SizedBox(height: 2),
                Text(cutText('DNI: ' + contact.document),
                  style: Skin.dropdownItemTextStyle(document: true)
                ),
              ]
            )
          )
        ]
      )
    );
  }

  String cutText(String text) => text.length > 38 ?
    text = text.substring(0, 18) + ('...') + text.substring(text.length - 19, text.length) : text;
}

