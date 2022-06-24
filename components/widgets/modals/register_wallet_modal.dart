
import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///  Register Wallet scrolleable window
///-----------------------------------------------------
///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
///  - email: 9780desarrollador09@gmail.com
///  - Date : 02/12/2021
Future<void> showRegisterWalletModal(BuildContext context) async => showModalBottomSheet(
  barrierColor       : Colors.white.withOpacity(0.4),
  elevation          : 100,
  context            : context,
  enableDrag         : true,
  isDismissible      : true,
  isScrollControlled : true,
  useRootNavigator   : true,
  builder            : (BuildContext bc) => const RegisterContainer()
);


class RegisterContainer extends StatefulWidget {
  const RegisterContainer({ Key? key }) : super(key: key);

  @override
  _RegisterContainerState createState() => _RegisterContainerState();
}

class _RegisterContainerState extends State<RegisterContainer> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 2,
          color: const Color(0xFF0A5F93),
        ),
        //-----------------------------------------------------------------------------
        Container(
          margin : const EdgeInsets.all(10),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child:
                Text('REGISTRAR BILLETERA',
                  style: Skin.dialogTextStyle(title: true),
                  textAlign: TextAlign.center
                )
              ),
              InkWell(
                onTap : ()=> Routes.hide(context),
                child :
                Container(
                  padding : const EdgeInsets.all(10),
                  child   : Icon(Icons.close_rounded, size: 25, color: Tint.blue.accent4)
                )
              ),
            ]
          )
        ),
        //-----------------------------------------------------------------------------
        Padding(
          padding : const EdgeInsets.symmetric(vertical: 15),
          child   :
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(context.read<DataProvider>().token.logo, width: 30, height: 30),
              const SizedBox(width: 10),
              Text(context.read<DataProvider>().token.name,
                style: Skin.dialogTextStyle(token: true),
              )
            ]
          )
        ),
        //-----------------------------------------------------------------------------
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
          child:
          Row(
            children: [
              Text('Alias', style: Skin.dialogTextStyle(label: true)),
              const SizedBox(width: 5),
              Text('(Opcional)', style: Skin.dialogTextStyle(helper: true))
            ]
          )
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child:
          CupertinoTextField(
            padding          : const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            autofocus        : false,
            // controller       : amountController,
            maxLines         : 2,
            textAlign        : TextAlign.left,
            decoration       : Skin.inputDecoration(),
            style            : Skin.inputTextStyle(),
            readOnly         : false,
            enabled          : true,
            // onTap            : ()=> changePadding(),
            onChanged        : (String text) {},
          )
        ),
        //-----------------------------------------------------------------------------
        Align(
          alignment : Alignment.centerLeft,
          child     :
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
            child: Text('Billetera', style: Skin.dialogTextStyle(label: true)),
          )
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child:
          CupertinoTextField(
            padding          : const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            autofocus        : false,
            // controller       : amountController,
            maxLines         : 2,
            textAlign        : TextAlign.left,
            decoration       : Skin.inputDecoration(),
            style            : Skin.inputTextStyle(),
            readOnly         : false,
            enabled          : true,
            // onTap            : ()=> changePadding(),
            onChanged        : (String text) {},
          )
        ),
        //-----------------------------------------------------------------------------
        Container(
          margin    : const EdgeInsets.only(bottom: 10),
          padding   : MediaQuery.of(context).viewInsets,
          alignment : Alignment.center,
          child     :
          TextButton(
            onPressed : () => {},
            child     :
            Container(
              margin     : EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
              padding    : const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              decoration : Skin.buttonDecoration(),
              child      : Text('AGREGAR', style: Skin.textButtonTextStyle())
            )
          )
        )
      ],
    );
  }
}