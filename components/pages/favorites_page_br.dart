import 'package:bank9780/assets/data_list/list_payment.dart';
import 'package:bank9780/assets/data_list/list_user_profile.dart';
import 'package:bank9780/components/widgets/modals/favorite_page_modal_BR.dart';
import 'package:bank9780/modules/general/button_class.dart';
import 'package:bank9780/modules/general/classes.dart';
import 'package:flutter/material.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:bank9780/components/widgets/overlays/menu_overlay.dart';

import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:provider/provider.dart';

class FavoritesPageBR extends StatefulWidget {
  const FavoritesPageBR({Key? key}) : super(key: key);

  @override
  State<FavoritesPageBR> createState() => _FavoritesPageBRState();
}

class _FavoritesPageBRState extends State<FavoritesPageBR>
    with AutomaticKeepAliveClientMixin<FavoritesPageBR> {
  late List<PaymentItemOwn> accountItems;
  final listKey = GlobalKey<AnimatedListState>();

  late List<Wallet> accountItems2;
  final listKey2 = GlobalKey<AnimatedListState>();

  late List<ContactItem> accountItems3;
  final listKey3 = GlobalKey<AnimatedListState>();

  late List<ContactItem> accountItems4;
  final listKey4 = GlobalKey<AnimatedListState>();

  late List<ContactItem> accountItems5;
  final listKey5 = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    accountItems = allPayment;
    //accountItems2 = wallets;
    accountItems3 = allContacts;
    accountItems4 = allContacts;
    accountItems5 = allContacts;
  }

  @override
  bool get wantKeepAlive => true; // ** and here

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      initialIndex: 2,
      length: 5,
      child: MaterialApp(
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: const Color(0xff154579),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.pop(this.context);
                  },
                );
              },
            ),
            title: const Text(
              "FAVORITOS",
            ),
            centerTitle: true,
            actions: [
              IconButton(
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
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.shopping_cart),
                  text: "PAGAMENTOS",
                ),
                Tab(
                  icon: Icon(Icons.payment),
                  text: "CARTEIRAS",
                ),
                Tab(
                  icon: Icon(Icons.contacts),
                  text: "CONTATOS",
                ),
                Tab(
                  icon: Icon(Icons.payments_outlined),
                  text: "CONTAS",
                ),
                Tab(
                  icon: Icon(Icons.payments),
                  text: "PIX",
                ),
              ],
            ),
          ),
          body: TabBarView(
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
                listKey: listKey4,
                accountItems: context.watch<DataProvider>().wallets,
              ),
              TabBarFive(
                listKey: listKey5,
                accountItems: context.watch<DataProvider>().wallets,
              ),
            ],
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

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
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.925,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "ENTIDAD/SERVICIO",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "CÓDIGO",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
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
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    "MONEDA",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "BILLETERA",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
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
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "FOTO",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "NOMBRES Y APELLIDOS",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
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
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
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
                      animation: animation,
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

/// Second Page provider prove
/// ------------------------------------

class TabBarFour extends StatefulWidget {
  const TabBarFour({
    Key? key,
    required this.listKey,
    required this.accountItems,
  }) : super(key: key);

  final GlobalKey<AnimatedListState> listKey;
  final List<Wallet> accountItems;

  @override
  State<TabBarFour> createState() => _TabBarFourState();
}

class _TabBarFourState extends State<TabBarFour> {
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "BANCO",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    "ALÍAS",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "NÚMERO DE CONTA",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Text(
                    "AÇÃO",
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.925,
                    child: AnimatedList(
                      key: widget.listKey,
                      initialItemCount: widget.accountItems.length,
                      itemBuilder: (context, index, animation) =>
                          FavoriteListButtonFourth(
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

/// Second Page provider prove
/// ------------------------------------

class TabBarFive extends StatefulWidget {
  const TabBarFive({
    Key? key,
    required this.listKey,
    required this.accountItems,
  }) : super(key: key);

  final GlobalKey<AnimatedListState> listKey;
  final List<Wallet> accountItems;

  @override
  State<TabBarFive> createState() => _TabBarFiveState();
}

class _TabBarFiveState extends State<TabBarFive> {
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "BANCO",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    "ALÍAS",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "PIX",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Text(
                    "AÇÃO",
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.925,
                    child: AnimatedList(
                      key: widget.listKey,
                      initialItemCount: widget.accountItems.length,
                      itemBuilder: (context, index, animation) =>
                          FavoriteListButtonFifth(
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
