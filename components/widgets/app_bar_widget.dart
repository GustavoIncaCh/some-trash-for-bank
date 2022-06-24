import 'package:bank9780/properties/routes.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:flutter/material.dart';

import 'overlays/menu_overlay.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    required this.appBarName,
    this.isInside = true,
    this.needImage = false,
    Key? key,
  }) : super(key: key);
  final String appBarName;
  final bool isInside;
  final bool needImage;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return (isInside)
        ? AppBar(
            centerTitle: true,
            backgroundColor: const Color(0xff154579),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.pop(context);
                    // just push
                    //Routes.home(context);
                    // push and remove implementation
                    //Navigator.pushAndRemoveUntil(
                    //    context,
                    //    MaterialPageRoute<void>(
                    //        builder: (BuildContext context) =>
                    //            const HomePage()),
                    //    ModalRoute.withName('/home'));
                  },
                );
              },
            ),
            title: Text(
              appBarName,
            ),
            actions: [
              IconButton(
                //style: ButtonStyle(
                //  backgroundColor: MaterialStateProperty.all<Color>(
                //    const Color(0xff154579),
                //  ),
                //),
                onPressed: () => Routes.notify(context),
                //child: const Icon(
                //  Icons.notifications,
                //  size: 30,
                //),
                icon: Stack(
                  children: [
                    const Icon(
                      Icons.notifications_none,
                      size: 34,
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 15,
                          minHeight: 14,
                        ),
                        child: const Text(
                          '10',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                    //Positioned(
                    //  top: 0.0,
                    //  right: 0.0,
                    //    child: Icon(
                    //  Icons.brightness_1,
                    //  size: 15.0,
                    //  color: Colors.redAccent,
                    //))
                  ],
                ),
                padding: EdgeInsets.zero,
              ),
              const SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () => showMenuOverlay(context),
                child: SizedBox(
                  width: 38,
                  height: 60,
                  child: Container(
                    width: 38,
                    height: 38,
                    alignment: Alignment.center,
                    decoration: Skin.circularButtonDecoration(footer: true),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(36)),
                      child: Image.asset('lib/assets/logos/dataphoto1.png'),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          )
        : AppBar(
            backgroundColor: const Color(0xff154579),
            //backgroundColor: Colors.transparent,
            shadowColor: Colors.black12,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    //Routes.home(context);
                    Navigator.pop(context);
                  },
                );
              },
            ),
            centerTitle: true,
            title: (!needImage)
                ? Text(
                    appBarName,
                  )
                : Image.asset(
                    'lib/assets/img/Group 279.png',
                  ),
          );
  }
}
