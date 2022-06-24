
import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsWidget extends StatelessWidget {
  const TabsWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment : Alignment.center,
      width     : size.width,
      child:
      Row(
        crossAxisAlignment : CrossAxisAlignment.end,
        mainAxisAlignment  : MainAxisAlignment.center,
        children           : [
          //...................................................................
          InkWell(
            onTap : () => context.read<DataProvider>().changeType(internal: true),
            child :
            Container(
              alignment  : Alignment.center,
              width      : (size.width / 2) - 40,
              height     : context.watch<DataProvider>().internal? 32 : 28,
              // padding    : EdgeInsets.symmetric(vertical: context.watch<DataProvider>().internal? 10 : 7),
              decoration : Skin.buttonDecoration(
                tapEnable  : context.watch<DataProvider>().internal,
                tapDisable : !context.watch<DataProvider>().internal
              ),
              child      : const Text('9780 Bank')
            )
          ),
          //...................................................................
          const SizedBox(width: 10),
          //...................................................................
          InkWell(
            onTap : () => context.read<DataProvider>().changeType(internal: false),
            child :
            Container(
              alignment  : Alignment.center,
              width      : (size.width / 2) - 40,
              height     : !context.watch<DataProvider>().internal? 32 : 28,
              // padding    : EdgeInsets.symmetric(vertical: !context.watch<DataProvider>().internal? 10 : 7),
              decoration : Skin.buttonDecoration(
                tapEnable  : !context.watch<DataProvider>().internal,
                tapDisable : context.watch<DataProvider>().internal
              ),
              child      :
              Text(
                context.watch<DataProvider>().type == 1 ||
                context.watch<DataProvider>().type == 3?
                'Otras billeteras' : 'Otros bancos',
                // style: Skin.tapTextStyle(false)
              )
            )
          ),
          //...................................................................
        ]
      )
    );
  }
}