import 'package:bank9780/assets/data_list/list_user_account.dart';
import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/components/widgets/modals/user_account_list_modal.dart';
import 'package:bank9780/components/widgets/transactionWidgets/button_list_route.dart';
import 'package:bank9780/modules/provider/menu_provider.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

import '../../modules/general/button_class.dart';

class UserAccounts extends StatefulWidget {
  const UserAccounts({Key? key}) : super(key: key);

  @override
  State<UserAccounts> createState() => _UserAccountsState();
}

class _UserAccountsState extends State<UserAccounts> {
  final listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
  }

  // ignore: todo
  // TODO: CHANGE THE STREAM - IT MUST BE CALLED FROM THE API
  Stream<AccountItem> generateNumbers = (() async* {
    await Future<void>.delayed(const Duration(seconds: 2));

    for (int i = 1; i <= 10; i++) {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield allAccount[i];
    }
  })();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MyAppBar(
        appBarName: 'MIS CUENTAS',
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF1A477C),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              ),
              child: const Text(
                'REGISTRAR CUENTA',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Routes.accountregister(context);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "LISTA DE MIS CUENTAS",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                //fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.925,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 2.5,
                      color: const Color(0xFF0C4F83),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "MONEDA",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "BANCO",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "ALIAS",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "ACCIÓN",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
              stream: generateNumbers,
              builder: (
                BuildContext context,
                AsyncSnapshot<AccountItem> snapshot,
                ){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width * 0.925,
                  child: const Center(child: CircularProgressIndicator()));
              } else if (snapshot.connectionState == ConnectionState.active
                  || snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  return SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width * 0.925,
                // check the AnimatedList
                child: AnimatedList(
                  key: listKey,
                  initialItemCount:
                      context.watch<MenuProvider>().allAccountProvider.length,
                  itemBuilder: (context, index, animation) =>
                      /// create the items of the list
                      AccountListButton(
                    context: context,
                    dateFormat: dateFormat,
                    accountListItems: context
                        .watch<MenuProvider>()
                        .allAccountProvider[index],
                    listAccount:
                        context.watch<MenuProvider>().allAccountProvider,
                    // moredItem checked
                    onClicked: () => removeItem(index),
                    animation: animation,
                  ),
                ),
              );
                } else {
                  return const Text('Empty data');
                }
              } else {
                return Text('State: ${snapshot.connectionState}');
              }
              }
            ),
          ],
        ),
      ),
    );
  }

  void removeItem(int index) {
    final removedItem =
        context.read<MenuProvider>().allAccountProvider[index];
    int count = 0;
    context.read<MenuProvider>().allAccountProvider.removeAt(index);
    if (listKey.currentState != null) {
      listKey.currentState!.removeItem(
        index,
        (context, animation) => AccountListButton(
          context: context,
          dateFormat: dateFormat,
          accountListItems: removedItem,
          listAccount: context.watch<MenuProvider>().allAccountProvider,
          onClicked: () {},
          animation: animation,
        ),
        duration: const Duration(milliseconds: 800),
      );
      /// carefull with the navigator double pop back
      /// it can close the app, it is used here for the tab button state
      Navigator.of(context).popUntil((_) => count++ >= 2);
    }
  }
}