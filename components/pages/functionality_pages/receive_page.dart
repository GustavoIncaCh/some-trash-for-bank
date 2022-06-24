
import 'package:animated_widgets/animated_widgets.dart';
import 'package:bank9780/components/widgets/transactionWidgets/receive_form_operation_widget.dart';
import 'package:bank9780/components/widgets/transactionWidgets/receive_form_widget.dart';
import 'package:bank9780/components/widgets/transactionWidgets/receive_qr_widget.dart';
import 'package:bank9780/components/widgets/transactionWidgets/tabs_widget.dart';
import 'package:bank9780/components/widgets/transactionWidgets/token_carousel_widget.dart';
import 'package:bank9780/modules/general/enum.dart';

import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


class ReceivePage extends StatefulWidget {
  ///  Receive Data Page
  ///-----------------------------------------------------
  ///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
  ///  - email: 9780desarrollador09@gmail.com
  ///  - Date : 02/12/2021
  const ReceivePage({Key? key}) : super(key: key);

  @override
  _ReceivePageState createState() => _ReceivePageState();
}

class _ReceivePageState extends State<ReceivePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children : [
        //----------------------------------------------------------------------------------
       const Flexible(
         child:
         Center(
           child:
           TokenCarouselWidget(
            fiat     : true,
            top      : 0,
            amount   : false,
            received : false,
          ),
         )
       ),
        // Container(
        //   decoration : Skin.gradientDecoration(),
        //   child      :
        //   Column(
        //     children: const [
        //       //---------------------------------------------------- TOP GRADIENT DECORATION
        //       TokenCarouselWidget(
        //         fiat     : true,
        //         top      : 0,
        //         amount   : false,
        //         received : false,
        //       ),
        //       //------------------------------------------------------------ TAPS INDICATORS
        //       TabsWidget(),
        //     ]
        //   )
        // ),
        //------------------------------------------------------------ CHANGE TYPE CONTAINER
        TranslationAnimatedWidget(
          curve   : Curves.easeOut,
          enabled : true,
          values  : const [
              Offset(0, 100),
              Offset(0, -100),
              Offset(0, 0),
          ],
          child:
          Column(
            children: [
              const TabsWidget(),
              Container(
                margin      : const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                padding     : const EdgeInsets.symmetric(horizontal: 20, vertical:5),
                decoration  : Skin.floatingContainerDecoration(),
                height      : 290,
                width       : MediaQuery.of(context).size.width,
                child       :
                context.watch<DataProvider>().type <= 3
                ? const ReceiveQrWidget()
                : context.watch<DataProvider>().type <= 4 ? const ReceiveFormWidget() : const ReceiveFormOperationWidget(),
              ),
            ],
          )
        )
        //----------------------------------------------------------------------------------
      ]
    );
  }

  showPinPage(){
    focus();
    Routes.pinPage(context: context, process: Process.login);
  }

  focus()=> FocusScope.of(context).hasFocus ? FocusScope.of(context).unfocus() : null;
}
