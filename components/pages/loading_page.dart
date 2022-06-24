import 'package:bank9780/modules/general/enum.dart';
import 'package:bank9780/modules/provider/client_provider.dart';
import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:bank9780/services/api/call/publicity.dart';
import 'package:bank9780/services/database/body.dart';
import 'package:bank9780/services/database/queries/register_data.dart';
import 'package:bank9780/services/shared_preferences/shared_preferences.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({ Key? key }) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {


  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 100),
      () async {
        if(!await SharedPrefs.getDBstatus()){
          SharedPrefs.setDBstatus(status: await DataBase.create());
          //SharedPrefs.setDBstatus(status: await DataBase.createId());
        }
        //TODO: get this into a logged conditional-------------------
        context.read<ClientProvider>().clientRegisterCreate(context);
        await RegisterData.getFirstData(context);
        //await RegisterData.getIds(context);
        //-----------------------------------------------------------

        String locale = await Devicelocale.currentLocale ?? 'NULL_NULL';
        List<String> locales = locale.split('-');

        context.setLocale(Locale(
          locales.first == 'pt'
          ? Languages.pt.name
          : Languages.es.name
        ));

        context.read<DataProvider>().changeLocales(
          context: context,
          language: locales.first == 'pt'
            ? Languages.pt
            : Languages.es,
          country: locales.first == 'pt'
            ? Countries.br
            : Countries.pe
        );

        await Publicity.getPublicity(context)
        ? Future.delayed(
          const Duration(seconds: 3),
          () => Routes.welcome(context)
        )
        : null;
      }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:
      SafeArea(
        child:
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child:
          Container(
            color     : const Color(0xFF1A477C),
            alignment : Alignment.center,
            child     : Image.asset('lib/assets/img/logo_green.png')
          )
        )
      )
    );
  }
}