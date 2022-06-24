
import 'package:bank9780/modules/general/classes.dart';
import 'package:bank9780/properties/skin.dart';

import 'package:flutter/material.dart';

class ItemWalletWidget extends StatelessWidget {

  final Wallet wallet;

  ///  Single token information box
  ///-----------------------------------------------------
  ///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
  ///  - email: 9780desarrollador09@gmail.com
  ///  - Date : 02/12/2021
  const ItemWalletWidget({
    required this.wallet,
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
          Image.asset(wallet.tokenLogo, width: 30, height: 30),
          const SizedBox(width: 10),
          Expanded(
            child:
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(wallet.tokenName, style: Skin.dropdownItemTextStyle()),
                    Text(wallet.name, style: Skin.dropdownItemTextStyle()),
                  ]
                ),
                const SizedBox(height: 2),
                Text(wallet.tokenAddress,
                  style: Skin.dropdownItemTextStyle(),
                  overflow: TextOverflow.ellipsis
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

