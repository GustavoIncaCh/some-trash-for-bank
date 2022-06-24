import 'package:bank9780/modules/general/button_class.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AccountListButton extends StatelessWidget {
  AccountListButton({
    Key? key,
    required this.context,
    required this.dateFormat,
    required this.accountListItems,
    required this.listAccount,
    required this.onClicked,
    required this.animation,
  }) : super(key: key);

  final BuildContext context;
  final DateFormat dateFormat;
  final AccountItem accountListItems;
  final List<AccountItem> listAccount;
  final VoidCallback? onClicked;
  final Animation<double> animation;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    //totalCoin = totalCoin + coin.coinPartCost;
    //print("si entra $totalCoin");
    return SizeTransition(
      // SlideTransition(
      //position: Tween<Offset>(begin: Offset(-1,0),
      //end: Offset.zero,).animate(CurvedAnimation(parent: animation, curve: Curves.elasticInOut),),
      //key: ValueKey(accountListItems.type),
      sizeFactor: animation,
      //position: animation,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          height: 30,
          decoration: BoxDecoration(
            color: Color(0x1A0A5F93),
            // border: Border(
            //     bottom: BorderSide(
            //   width: 3,
            //   color: Color(0xFF0C4F83),
            // )),
            //border: Border.all(color: const Color(0xff3C3C3B), width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(13),
            // boxShadow: const [
            //     BoxShadow(
            //       color: Color(0xff7D7676),
            //       offset: Offset(-1,2),
            //       blurRadius: 5,
            //       blurStyle: BlurStyle.normal,
            //     ),
            //   ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              SizedBox(
                width: 80,
                child: Text(
                  accountListItems.type,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Expanded(
                child: Text(
                  accountListItems.bank,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.02,
              ),
              Expanded(
                child: Text(
                  accountListItems.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.01,
              ),
              PopupMenuButton(
                //color: Colors.red,
                icon: Icon(Icons.more_vert),
                padding: EdgeInsets.all(0),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      // leading: const Icon(
                      //   Icons.view_list_rounded,
                      //   size: 30,
                      // ),
                      title: const Text("Detalles"),
                      onTap: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text("N° de cuenta:"),
                                Text(accountListItems.accountNumber),
                                const Text("N° de cuenta interbancaria"),
                                Text(accountListItems.interbankAccount),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(
                                  context,
                                ).pop();
                                count = 0;
                              },
                              child: const Text(
                                'Aceptar',
                                style: TextStyle(
                                  color: Color(0XFF154579),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      // leading: const Icon(
                      //   Icons.delete,
                      //   size: 30,
                      // ),
                      title: const Text("Borrar"),
                      onTap: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content: const SizedBox(
                            //height: MediaQuery.of(context).size.height * 0.05,
                            child: Text(
                                "Esta seguro que desea eliminar esta cuenta."),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(
                                  context,
                                ).pop();
                                count = 0;
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Color(0XFF154579),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: onClicked,
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                  color: Color(0XFF154579),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    value: 2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
