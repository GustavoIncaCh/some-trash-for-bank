import 'package:bank9780/assets/data_list/list_payment.dart';
import 'package:bank9780/assets/data_list/list_user_profile.dart';
import 'package:bank9780/components/widgets/modals/favorite_first_page_modal.dart';
import 'package:bank9780/modules/general/button_class.dart';
import 'package:bank9780/modules/general/classes.dart';
import 'package:flutter/material.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:bank9780/components/widgets/overlays/menu_overlay.dart';

import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:provider/provider.dart';

import '../../modules/provider/menu_provider.dart';
import '../widgets/modals/user_account_list_modal.dart';
import '../widgets/transactionWidgets/button_list_route.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage>
    with AutomaticKeepAliveClientMixin<FavoritesPage> {
  late List<PaymentItemOwn> accountItems;
  final listKey = GlobalKey<AnimatedListState>();

  late List<Wallet> accountItems2;
  final listKey2 = GlobalKey<AnimatedListState>();

  late List<ContactItem> accountItems3;
  final listKey3 = GlobalKey<AnimatedListState>();

  late List<ContactItem> accountItems4;
  final listKey4 = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    accountItems = allPayment;
    //accountItems2 = wallets;
    accountItems3 = allContacts;
  }

  @override
  bool get wantKeepAlive => true; // ** and here

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: MaterialApp(
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: const Color(0xff154579),
            //backgroundColor: Colors.white,
            //foregroundColor: Colors.green,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    //Routes.home(this.context);
                    Navigator.pop(this.context);
                  },
                );
              },
            ),
            title: const Text(
              "FAVORITOS",
              //style: TextStyle(fontFamily: "ROBOTO"),
            ),
            centerTitle: true,
            actions: [
              //ButtonWidget(onClicked: () => Routes.notify(context),),
              IconButton(
                //style: ButtonStyle(
                //  backgroundColor: MaterialStateProperty.all<Color>(
                //    const Color(0xff154579),
                //  ),
                //),
                onPressed: () => Routes.notify(context),
                icon: const Icon(
                  Icons.notifications_outlined,
                  size: 30,
                ),
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
                  // Icon(Icons.menu_outlined, color: Colors.white, size: 30)
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
            bottom: 
            PreferredSize(
        preferredSize: _tabBar.preferredSize,
        child: Material(
          //textStyle: TextStyle(color: Colors.amber),
          color: Colors.white, //<-- SEE HERE
          child: _tabBar,
        ),
      ),
            
          ),
          body: TabBarView(
            
            // ignore: todo
            // TODO: add a condition to give the change to call the BR version
            // in the same page, just with nullable values
            children: <Widget>[
              TabBarOne(
                listKey: listKey,
                accountItems: accountItems,
              ),
              TabBarTwo(
                listKey: listKey2,
                accountItems: context.watch<DataProvider>().wallets,
              ),
              TabBarThree(
                listKey: listKey3,
                accountItems: accountItems3,
              ),
              TabBarFour(
                listKey: listKey3,
                accountItems: accountItems3,
              ),
            ],
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

TabBar get _tabBar => 
const TabBar(
              // overlayColor: MaterialStateProperty.all<Color?>(
              //             Colors.pink),
               labelColor: Color(0xff0A5F93),
               labelStyle: TextStyle(fontSize: 12),
               indicatorColor: Color(0xff0A5F93),
               padding: EdgeInsets.all(0.0),
              // unselectedLabelColor: Colors.purple,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.shopping_cart),
                  text: "PAGOS",
                ),
                Tab(
                  icon: Icon(Icons.payment),
                  text: "BILLETERAS",
                ),
                Tab(
                  icon: Icon(Icons.contacts),
                  text: "CONTACTOS",
                ),
                Tab(
                  icon: Icon(Icons.account_balance),
                  text: "CUENTAS",
                ),
              ],
            );

class TabBarOne extends StatefulWidget {
  const TabBarOne({
    Key? key,
    required this.listKey,
    required this.accountItems,
  }) : super(key: key);

  final GlobalKey<AnimatedListState> listKey;
  final List<PaymentItemOwn> accountItems;

  @override
  State<TabBarOne> createState() => _TabBarOneState();
}

class _TabBarOneState extends State<TabBarOne> {
  Stream<int> streamTabOne = (() async* {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    yield 1;
  })();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.add_circle_outline, size: 20,color: Color(0xff0A5F93),)),
              const Text("AGREGAR", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color(0xff0A5F93)),),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.925,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "ENTIDAD/SERVICIO",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color(0xff0A5F93)),
                  ),
                  Text(
                    "CÓDIGO",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color(0xff0A5F93)),
                  ),
                  Text(
                    "ALIAS",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color(0xff0A5F93)),
                  ),
                  Text(
                    "ELIMINAR",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color(0xff0A5F93)),
                  ),
                ]),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.025),
        StreamBuilder<int>(
            stream: streamTabOne,
            initialData: 0,
            builder: (
              BuildContext context,
              AsyncSnapshot<int> snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.925,
                    child: const Center(child: CircularProgressIndicator()));
              } else if (snapshot.connectionState == ConnectionState.active ||
                  snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: SizedBox(
                      //height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width * 0.925,
                      //child: CreateListViewAccount(accountItems: accountItems),
                      child: AnimatedList(
                        key: widget.listKey,
                        initialItemCount: widget.accountItems.length,
                        itemBuilder: (context, index, animation) =>
                            FavoriteListButtonOne(
                          context: context,
                          paymentListItems: widget.accountItems[index],
                          listAccount: widget.accountItems,
                          // RemoveItem problem solved, always use a diferent
                          // context for each tabPage and do the same for the
                          // controllers as the animator controler and the functions
                          // of itselve, find a way to provide this
                          onClicked: () => removeItem(index),
                          //onClicked: (){},
                          animation: animation,
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Text('Empty data');
                }
              } else {
                return Text('State: ${snapshot.connectionState}');
              }
            }),
      ],
    );
  }

  void removeItem(int index) {
    final removedItem = widget.accountItems[index];
    widget.accountItems.removeAt(index);
    widget.listKey.currentState!.removeItem(
      index,
      (context, animation) => FavoriteListButtonOne(
        context: context,
        paymentListItems: removedItem,
        listAccount: widget.accountItems,
        onClicked: () {},
        animation: animation,
      ),
      duration: const Duration(milliseconds: 800),
    );
    //Navigator.pop(this.context);
    //Navigator.of(context).popUntil((_) => count++ >= 1);
  }
}

/// Second Page provider prove
/// ------------------------------------

class TabBarTwo extends StatefulWidget {
  const TabBarTwo({
    Key? key,
    required this.listKey,
    required this.accountItems,
  }) : super(key: key);

  final GlobalKey<AnimatedListState> listKey;
  final List<Wallet> accountItems;

  @override
  State<TabBarTwo> createState() => _TabBarTwoState();
}

class _TabBarTwoState extends State<TabBarTwo> {
  Stream<int> streamTabTwo = (() async* {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    yield 1;
  })();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.925,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "MONEDA",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color(0xff0A5F93)),
                  ),
                  Text(
                    "BILLETERA",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color(0xff0A5F93)),
                  ),
                  Text(
                    "ELIMINAR",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color(0xff0A5F93)),
                  ),
                ]),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.025),
        StreamBuilder(
            stream: streamTabTwo,
            initialData: 0,
            builder: (
              BuildContext context,
              AsyncSnapshot<int> snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.925,
                    child: const Center(child: CircularProgressIndicator()));
              } else if (snapshot.connectionState == ConnectionState.active ||
                  snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: SizedBox(
                      //height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width * 0.925,
                      child: AnimatedList(
                        key: widget.listKey,
                        initialItemCount: widget.accountItems.length,
                        itemBuilder: (context, index, animation) =>
                            FavoriteListButtonTwo(
                          context: context,
                          paymentListItems: widget.accountItems[index],
                          listAccount: widget.accountItems,
                          // RemoveItem problem solved, always use a diferent
                          // context for each tabPage and do the same for the
                          // controllers as the animator controler and the functions
                          // of itselve, find a way to provide this
                          onClicked: () => removeItem(index),
                          //onClicked: (){},
                          animation: animation,
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Text('Empty data');
                }
              } else {
                return Text('State: ${snapshot.connectionState}');
              }
            }),
      ],
    );
  }

  void removeItem(int index) {
    final removedItem = widget.accountItems[index];
    widget.accountItems.removeAt(index);
    widget.listKey.currentState!.removeItem(
      index,
      (context, animation) => FavoriteListButtonTwo(
        context: context,
        paymentListItems: removedItem,
        listAccount: widget.accountItems,
        onClicked: () {},
        animation: animation,
      ),
      duration: const Duration(milliseconds: 800),
    );
  }
}

/// Second Page for real
/// ------------------------------------

//class TabBarTwo extends StatefulWidget {
//  const TabBarTwo({
//    Key? key,
//    required this.listKey,
//    required this.accountItems,
//  }) : super(key: key);
//
//  final GlobalKey<AnimatedListState> listKey;
//  final List<BillItem> accountItems;
//
//  @override
//  State<TabBarTwo> createState() => _TabBarTwoState();
//}
//
//class _TabBarTwoState extends State<TabBarTwo> {
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      mainAxisAlignment: MainAxisAlignment.start,
//      children: [
//        SizedBox(
//            height: MediaQuery.of(context).size.height * 0.05),
//        SizedBox(
//          width: MediaQuery.of(context).size.height * 0.55,
//          child: Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 8.0),
//            child: Row(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: const [
//                  Text(
//                    "MONEDA",
//                    style: TextStyle(fontWeight: FontWeight.bold),
//                  ),
//                  Expanded(
//                    child: Center(
//                      child: Text(
//                        "BILLETERA",
//                        style:
//                            TextStyle(fontWeight: FontWeight.bold),
//                      ),
//                    ),
//                  ),
//                ]),
//          ),
//        ),
//        SizedBox(
//            height: MediaQuery.of(context).size.height * 0.025),
//        SizedBox(
//          height: MediaQuery.of(context).size.height * 0.6,
//          width: MediaQuery.of(context).size.height * 0.55,
//          child: AnimatedList(
//            key: widget.listKey,
//            initialItemCount: widget.accountItems.length,
//            itemBuilder: (context, index, animation) =>
//                FavoriteListButtonTwo(
//              context: context,
//              paymentListItems: widget.accountItems[index],
//              listAccount: widget.accountItems,
//              // RemoveItem problem solved, always use a diferent
//              // context for each tabPage and do the same for the
//              // controllers as the animator controler and the functions
//              // of itselve, find a way to provide this
//              onClicked: () => removeItem(index),
//              //onClicked: (){},
//              animation: animation,
//            ),
//          ),
//        ),
//      ],
//    );
//  }
//
//  void removeItem(int index) {
//    final removedItem = widget.accountItems[index];
//    widget.accountItems.removeAt(index);
//      widget.listKey.currentState!.removeItem(
//        index,
//        (context, animation) => FavoriteListButtonTwo(
//          context: context,
//          paymentListItems:  removedItem,
//          listAccount: widget.accountItems,
//          onClicked: () {},
//          animation: animation,
//        ),
//        duration: const Duration(milliseconds: 800),
//      );
//  }
//}

/// third page
/// ---------------------------------------------------

class TabBarThree extends StatefulWidget {
  const TabBarThree({
    Key? key,
    required this.listKey,
    required this.accountItems,
  }) : super(key: key);

  final GlobalKey<AnimatedListState> listKey;
  final List<ContactItem> accountItems;

  @override
  State<TabBarThree> createState() => _TabBarThreeState();
}

class _TabBarThreeState extends State<TabBarThree> {
  Stream<int> streamTabThree = (() async* {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    yield 1;
  })();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.925,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "FOTO",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color(0xff0A5F93)),
                  ),
                  Text(
                    "CONTACTO",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color(0xff0A5F93)),
                  ),
                  Text(
                    "ELIMINAR",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color(0xff0A5F93)),
                  ),
                ]),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.025),
        StreamBuilder(
          stream: streamTabThree,
          initialData: 0,
          builder: (
            BuildContext context,
            AsyncSnapshot<int> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.925,
                child: const Center(child: CircularProgressIndicator()),
              );
            } else if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text("Error");
              } else if (snapshot.hasData) {
                return Expanded(
                  child: SizedBox(
                    //height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.925,
                    child: AnimatedList(
                      key: widget.listKey,
                      initialItemCount: widget.accountItems.length,
                      itemBuilder: (context, index, animation) =>
                          FavoriteListButtonThree(
                        context: context,
                        paymentListItems: widget.accountItems[index],
                        listAccount: widget.accountItems,
                        // RemoveItem problem solved, always use a diferent
                        // context for each tabPage and do the same for the
                        // controllers as the animator controler and the functions
                        // of itselve, find a way to provide this
                        onClicked: () => removeItem(index),
                        //onClicked: (){},
                        animation: animation,
                      ),
                    ),
                  ),
                );
              }else {
              return const Text("Emptydata");
            }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          },
        )
      ],
    );
  }

  void removeItem(int index) {
    final removedItem = widget.accountItems[index];
    widget.accountItems.removeAt(index);
    widget.listKey.currentState!.removeItem(
      index,
      (context, animation) => FavoriteListButtonThree(
        context: context,
        paymentListItems: removedItem,
        listAccount: widget.accountItems,
        onClicked: () {},
        animation: animation,
      ),
      duration: const Duration(milliseconds: 800),
    );
  }
}

class TabBarFour extends StatefulWidget {
  const TabBarFour({
    Key? key,
    required this.listKey,
    required this.accountItems,
  }) : super(key: key);

  final GlobalKey<AnimatedListState> listKey;
  final List<ContactItem> accountItems;

  @override
  State<TabBarFour> createState() => _TabBarFourState();
}

class _TabBarFourState extends State<TabBarFour> {
  Stream<int> streamTabFour = (() async* {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    yield 1;
  })();
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            // const SizedBox(
            //   height: 15,
            // ),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     primary: const Color(0xFF1A477C),
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            //   ),
            //   child: const Text(
            //     'REGISTRAR CUENTA',
            //     style: TextStyle(fontSize: 20),
            //   ),
            //   onPressed: () {
            //     Routes.accountregister(context);
            //   },
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // const Text(
            //   "LISTA DE MIS CUENTAS",
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 20,
            //     //fontFamily: 'Roboto',
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.925,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            StreamBuilder(
              stream: streamTabFour,
              initialData: 0,
              builder: (
                BuildContext context,
                AsyncSnapshot<int> snapshot,
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
                  return Expanded(
                    child: SizedBox(
                                 // height: MediaQuery.of(context).size.height * 0.55,
                                  width: MediaQuery.of(context).size.width * 0.925,
                                  // check the AnimatedList
                                  child: AnimatedList(
                    key: widget.listKey,
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
        );
  }

  void removeItem(int index) {
    final removedItem =
        context.read<MenuProvider>().allAccountProvider[index];
    int count = 0;
    context.read<MenuProvider>().allAccountProvider.removeAt(index);
    if (widget.listKey.currentState != null) {
      widget.listKey.currentState!.removeItem(
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
