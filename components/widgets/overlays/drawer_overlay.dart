
import 'package:bank9780/components/pages/welcome_page.dart';

import 'package:bank9780/properties/routes.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:flutter/material.dart';

import '../../../services/api/call/terms.dart';

class BankDrawer extends StatefulWidget {
  const BankDrawer({Key? key}) : super(key: key);

  @override
  State<BankDrawer> createState() => _BankDrawerState();
}

class _BankDrawerState extends State<BankDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text('Drawer Header'),
          ),
          //ElevatedButton(
          //  style: ButtonStyle(
          //    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff0C4F83)),
          //    minimumSize: MaterialStateProperty.all<Size>(const Size(50, 25)),
          //  ),
          //  child: Text('PORTAFOLIO', style: Skin.menuTextStyle()),
          //  onPressed: () => Routes.portfolio(context),
          //),
          SizedBox(
            height: 35,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              dense: true,
              // maximumDensity change in the VisualDensity package from <-4,4> to <-10,10>
              visualDensity: VisualDensity(vertical: -6),
              title: Container(
                width: 280,
                height: 30,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: Skin.menuItemDecoration(),
                child: Text('PORTAFOLIO', style: Skin.menuTextStyle()),
              ),
              onTap: () {
                Routes.portfolio(context);
              },
            ),
          ),
          SizedBox(
            height: 35,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              dense: true,
              visualDensity: VisualDensity(vertical: -6),
              title: Container(
                width: 280,
                height: 30,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: Skin.menuItemDecoration(),
                child: Text('HISTORIALES', style: Skin.menuTextStyle()),
              ),
              onTap: () {
                Routes.record(context);
              },
            ),
          ),
          SizedBox(
            height: 35,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              dense: true,
              visualDensity: VisualDensity(vertical: -5),
              title: Container(
                width: 280,
                height: 30,
                margin: const EdgeInsets.all(5),
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: Skin.menuItemDecoration(),
                child:
                    Text('MIS CUENTAS BANCARIAS', style: Skin.menuTextStyle()),
              ),
              onTap: () {
                Routes.useraccount(context);
              },
            ),
          ),
          SizedBox(
            height: 35,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              dense: true,
              visualDensity: VisualDensity(vertical: -5),
              title: Container(
                width: 280,
                height: 30,
                margin: const EdgeInsets.all(5),
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: Skin.menuItemDecoration(),
                child: Text('FAVORITOS', style: Skin.menuTextStyle()),
              ),
              onTap: () {
                Routes.favorites(context);
              },
            ),
          ),
          SizedBox(
            height: 35,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              dense: true,
              visualDensity: VisualDensity(vertical: -5),
              title: Container(
                width: 280,
                height: 30,
                margin: const EdgeInsets.all(5),
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: Skin.menuItemDecoration(),
                child: Text('CONFIGURACIÓN', style: Skin.menuTextStyle()),
              ),
              onTap: () {
                Routes.config(context);
              },
            ),
          ),
          SizedBox(
            height: 35,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              dense: true,
              visualDensity: VisualDensity(vertical: -5),
              title: Container(
                width: 280,
                height: 30,
                margin: const EdgeInsets.all(5),
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: Skin.menuItemDecoration(),
                child: Text('CONTACTO', style: Skin.menuTextStyle()),
              ),
              onTap: () {
                Routes.help(context);
              },
            ),
          ),
          SizedBox(
            height: 35,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              dense: true,
              visualDensity: VisualDensity(vertical: -5),
              title: Container(
                width: 280,
                height: 30,
                margin: const EdgeInsets.all(5),
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: Skin.menuItemDecoration(),
                child: Text('MIS AGENCIAS', style: Skin.menuTextStyle()),
              ),
              onTap: () {
                Routes.agencies(context);
              },
            ),
          ),
          SizedBox(
            height: 35,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              dense: true,
              visualDensity: VisualDensity(vertical: -5),
              title: Container(
                width: 280,
                height: 30,
                margin: const EdgeInsets.all(5),
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: Skin.menuItemDecoration(),
                child:
                    Text('PROGRAMA DE REFERIDOS', style: Skin.menuTextStyle()),
              ),
              onTap: () {
                Routes.referrals(context);
              },
            ),
          ),
          SizedBox(
            height: 35,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              dense: true,
              visualDensity: VisualDensity(vertical: -5),
              title: Container(
                width: 280,
                height: 30,
                margin: const EdgeInsets.all(5),
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: Skin.menuItemDecoration(),
                child: Text('TUTORIALES', style: Skin.menuTextStyle()),
              ),
              onTap: () {
                Routes.tutorial(context);
              },
            ),
          ),
          SizedBox(
            height: 35,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              dense: true,
              visualDensity: VisualDensity(vertical: -5),
              title: Container(
                width: 280,
                height: 30,
                margin: const EdgeInsets.all(5),
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: Skin.menuItemDecoration(),
                child: Text('ABOUT US', style: Skin.menuTextStyle()),
              ),
              onTap: () {
                Routes.aboutus(context);
              },
            ),
          ),
          SizedBox(
            height: 35,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              dense: true,
              visualDensity: VisualDensity(vertical: -5),
              title: Container(
                width: 280,
                height: 30,
                margin: const EdgeInsets.all(5),
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: Skin.menuItemDecoration(),
                child:
                    Text('TÉRMINOS Y CONDICIONES', style: Skin.menuTextStyle()),
              ),
              onTap: () async {
                await Terms.getTerms(context)
                    ? Future.delayed(const Duration(milliseconds: 500),
                        () => Routes.terms(context))
                    : null;
              },
            ),
          ),
          SizedBox(
            height: 35,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              dense: true,
              visualDensity: VisualDensity(vertical: -5),
              title: Container(
                width: 280,
                height: 30,
                margin: const EdgeInsets.all(5),
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: Skin.menuItemDecoration(),
                child: Text('CERRAR SESIÓN', style: Skin.menuTextStyle()),
              ),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const WelcomePage()),
                    ModalRoute.withName('/welcome'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
