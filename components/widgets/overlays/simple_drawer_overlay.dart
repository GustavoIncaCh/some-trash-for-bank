
import 'package:bank9780/components/pages/welcome_page.dart';

import 'package:bank9780/properties/routes.dart';
import 'package:flutter/material.dart';

import '../../../services/api/call/terms.dart';

class BankMenuDrawer extends StatefulWidget {
  const BankMenuDrawer({Key? key}) : super(key: key);

  @override
  State<BankMenuDrawer> createState() => _BankMenuDrawerState();
}

class _BankMenuDrawerState extends State<BankMenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF154579),
            Color(0xFF0C4F83),
          ],
          stops: <double>[0.0, 1.0],
        ),
      ),
      child: Drawer(
        backgroundColor: Color(0xFF275F9B),
        //backgroundColor: const Color.fromARGB(255, 48, 48, 48),
        elevation: 0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              //color: const Color.fromARGB(255, 61, 61, 61),
              color: Color.fromARGB(255, 51, 119, 191),
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 0,top: 50),
                child: ListTile(
      title: Row(
        children: const [
          Icon(
                Icons.person,
                color: Color(0xffffffff),
                //color: const Color(0xFF154579),
          ),
          Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'MI PERFIL',
                  style: TextStyle(color: Colors.white),
                ),
          )
        ],
      ),
      onTap: (){Navigator.pop(context);},
      dense: true,
    ),
              ),
            ),
            const Divider(),
            DrawerItem(
              icon: Icons.cases_sharp,
              text: 'PORTAFOLIO',
              onTap: () {
                Navigator.pop(context);
                Routes.portfolio(context);
              },
            ),
            DrawerItem(
              icon: Icons.history,
              text: 'HISTORIALES',
              onTap: () {
                Navigator.pop(context);
                Routes.record(context);
              },
            ),
            DrawerItem(
              icon: Icons.account_balance,
              text: 'MIS CUENTAS BANCARIAS',
              onTap: () {
                Navigator.pop(context);
                Routes.useraccount(context);
              },
            ),
            DrawerItem(
              icon: Icons.favorite,
              text: 'FAVORITOS',
              onTap: () {
                Navigator.pop(context);
                Routes.favorites(context);
              },
            ),
            DrawerItem(
              icon: Icons.settings,
              text: 'CONFIGURACIÓN',
              onTap: () {
                Navigator.pop(context);
                Routes.config(context);
              },
            ),
            DrawerItem(
              icon: Icons.account_box,
              text: 'CONTACTO',
              onTap: () {
                Navigator.pop(context);
                Routes.help(context);
              },
            ),
            DrawerItem(
              icon: Icons.location_pin,
              text: 'MIS AGENCIAS',
              onTap: () {
                Navigator.pop(context);
                Routes.agencies(context);
              },
            ),
            DrawerItem(
              //icon: Icons.safety_divider,
              icon: Icons.reply_all_outlined,
              text: 'PROGRAMA DE REFERIDOS',
              onTap: () {
                Navigator.pop(context);
                Routes.referrals(context);
              },
            ),
            DrawerItem(
              icon: Icons.ondemand_video_rounded,
              text: 'TUTORIALES',
              onTap: () {
                Navigator.pop(context);
                Routes.tutorial(context);
              },
            ),
            DrawerItem(
              icon: Icons.people,
              text: 'ABOUT US',
              onTap: () {
                Navigator.pop(context);
                Routes.aboutus(context);
              },
            ),
            DrawerItem(
              icon: Icons.file_copy,
              text: 'TÉRMINOS Y CONDICIONES',
              onTap: () async {
                //Navigator.pop(context);
                await Terms.getTerms(context)
                    ? Future.delayed(const Duration(milliseconds: 500),
                        () => Routes.terms(context))
                    : null;
              },
            ),
            const Divider(),
            DrawerItem(
              icon: Icons.logout,
              text: 'CERRAR SESIÓN',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const WelcomePage()),
                    ModalRoute.withName('/welcome'));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: const EdgeInsets.only(left: 0, top: 5),
      child: DrawerItem(
        icon: Icons.person,
        text: 'MI PERFIL',
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class DrawerItem extends StatefulWidget {
  DrawerItem(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);
  IconData icon;
  String text;
  GestureTapCallback onTap;
  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            widget.icon,
            color: const Color(0xffffffff),
            //color: const Color(0xFF154579),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              widget.text,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      onTap: widget.onTap,
      dense: true,
    );
  }
}
