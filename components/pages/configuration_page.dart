import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:flutter/material.dart';
import 'package:bank9780/modules/general/button_class.dart';
import 'package:bank9780/components/widgets/transactionWidgets/button_list_route.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: const MyAppBar(appBarName: "CONFIGURACIÓN"),
      body: Consumer<DataProvider>(
        builder: (context, value, child) => Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text("Mis Datos",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center),
                    ),
                    onPressed: () {
                      Routes.user(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF1A477C),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 13),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text("Límites",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            //fontFamily: 'Roboto',
                          ),
                          textAlign: TextAlign.center),
                    ),
                    onPressed: () {
                      Routes.bounds(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF1A477C),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 13),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ButtonListRoute(
                    buttonName: "Seguridad",
                    menuListItems: ItemMenus.configurationPageButtons,
                  ),
                ),
                // configuration language, give an eye here
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ButtonListRoute(
                    buttonName: 'language'.tr(),
                    menuListItems: ItemMenus.configurationPageButtons2,
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text("Dispositivos Vinculados",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center),
                    ),
                    onPressed: () {
                      Routes.devices(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF1A477C),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 13),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
