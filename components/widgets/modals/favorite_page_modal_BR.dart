import 'package:bank9780/modules/general/button_class.dart';
import 'package:bank9780/modules/general/classes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../modules/provider/data_provider.dart';

// ignore: must_be_immutable
class FavoriteListButtonOne extends StatelessWidget {
  FavoriteListButtonOne({
    Key? key,
    required this.context,
    required this.paymentListItems,
    required this.listAccount,
    required this.onClicked,
    required this.animation,
  }) : super(key: key);

  final BuildContext context;
  final PaymentItemOwn paymentListItems;
  final List<PaymentItemOwn> listAccount;
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
      //key: ValueKey(paymentListItems.type),
      sizeFactor: animation,
      //position: animation,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 3),
        child: Container(
          height: 55,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
              width: 3,
              color: Color(0xFF0C4F83),
            )),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.225,
                child: Text(paymentListItems.name),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.02,
              ),
              Expanded(
                child: Text(paymentListItems.code),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.02,
              ),
              IconButton(
                onPressed: onClicked,
                //()=>showDialog<String>(context: context, builder:(BuildContext context) => AlertDialog(
                //          content: SizedBox(
                //            height: MediaQuery.of(context).size.height * 0.15,
                //            child: const Text(
                //                "Esta seguro que desea eliminar esta cuenta."),
                //          ),
                //          actions: <Widget>[
                //            TextButton(
                //              onPressed: () {
                //                Navigator.pop(context);
                //              },
                //              child: const Text(
                //                'Cancel',
                //                style: TextStyle(
                //                  color: Color(0XFF154579),
                //                ),
                //              ),
                //            ),
                //            TextButton(
                //              onPressed: onClicked,
                //              child: const Text(
                //                'OK',
                //                style: TextStyle(
                //                  color: Color(0XFF154579),
                //                ),
                //              ),
                //            ),
                //          ],
                //        ),),
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// second Clase for tab page provider prove
/// --------------------------------------------------
// ignore: must_be_immutable
class FavoriteListButtonTwo extends StatefulWidget {
  const FavoriteListButtonTwo({
    Key? key,
    required this.context,
    required this.paymentListItems,
    required this.listAccount,
    required this.onClicked,
    required this.animation,
  }) : super(key: key);

  final BuildContext context;
  final Wallet paymentListItems;
  final List<Wallet> listAccount;
  final VoidCallback? onClicked;
  final Animation<double> animation;

  @override
  State<FavoriteListButtonTwo> createState() => _FavoriteListButtonTwoState();
}

class _FavoriteListButtonTwoState extends State<FavoriteListButtonTwo> {
  int count = 0;

  late FocusNode focusNode;

   @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  //bool enabledButton = false;
  @override
  Widget build(BuildContext context) {
    //totalCoin = totalCoin + coin.coinPartCost;
    //print("si entra $totalCoin");
    return SizeTransition(
      // SlideTransition(
      //position: Tween<Offset>(begin: Offset(-1,0),
      //end: Offset.zero,).animate(CurvedAnimation(parent: animation, curve: Curves.elasticInOut),),
      //key: ValueKey(paymentListItems.type),
      sizeFactor: widget.animation,
      //position: animation,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 3),
        child: Container(
          height: 55,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
              width: 3,
              color: Color(0xFF0C4F83),
            )),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.035,
                child: Image.asset(
                  widget.paymentListItems.tokenLogo,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                  width: MediaQuery.of(context).size.height * 0.08,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(widget.paymentListItems.tokenName),
                      Text(
                        widget.paymentListItems.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                      //Text(
                      //  "${paymentListItems.name}",
                      //  overflow: TextOverflow.clip,
                      //  maxLines: 1,
                      //  softWrap: false,
                      //),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 25,
                child: IconButton(
                  icon: const Icon(Icons.mode_edit_outline_outlined),
                  onPressed: () {
                    context.read<DataProvider>().changeActiveWallet(widget.paymentListItems);
                    //FocusManager.instance.primaryFocus?.unfocus();
                    if (widget.paymentListItems.aciveEnable){
                      debugPrint("show");
                      showKeyboard();
                    }
                    else {
                      debugPrint("dismiss");
                      dismissKeyboard();
                    }
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.02,
              ),
              Expanded(
                child: Theme(
                  // theme added to give a color to the disabled state
                  data: ThemeData(disabledColor: Colors.black),
                  child: TextField(
                    //focusNode: FocusNode(),
                    focusNode: focusNode,
                    cursorColor: Colors.black,
                          decoration: InputDecoration(
                            //enabled: widget.paymentListItems.aciveEnable,
                            //fillColor: Colors.black,
                            //focusColor: Colors.black,
                            //hoverColor: Colors.black,
                            //iconColor: Colors.black,
                            labelText: widget.paymentListItems.tokenAddress,
                            hintMaxLines: 2,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            hintStyle: const TextStyle(color: Colors.black),
                            //floatingLabelAlignment: FloatingLabelAlignment.center,
                            //floatingLabelStyle: TextStyle(color: Colors.green),
                            //border: InputBorder.none
                          ),
                          onSubmitted: (value){
                      context.read<DataProvider>().changeActiveWallet(widget.paymentListItems);
                      } ,
                          style: const TextStyle(color: Colors.black,overflow: TextOverflow.ellipsis,)
                        ),
                ),
               //Text(
               //  paymentListItems.tokenAddress,
               //  overflow: TextOverflow.ellipsis,
               //  maxLines: 2,
               //),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.02,
              ),
              IconButton(
                onPressed: widget.onClicked,
                //()=>showDialog<String>(context: context, builder:(BuildContext context) => AlertDialog(
                //          content: SizedBox(
                //            height: MediaQuery.of(context).size.height * 0.15,
                //            child: const Text(
                //                "Esta seguro que desea eliminar esta cuenta."),
                //          ),
                //          actions: <Widget>[
                //            TextButton(
                //              onPressed: () {
                //                Navigator.pop(context);
                //              },
                //              child: const Text(
                //                'Cancel',
                //                style: TextStyle(
                //                  color: Color(0XFF154579),
                //                ),
                //              ),
                //            ),
                //            TextButton(
                //              onPressed: onClicked,
                //              child: const Text(
                //                'OK',
                //                style: TextStyle(
                //                  color: Color(0XFF154579),
                //                ),
                //              ),
                //            ),
                //          ],
                //        ),),
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showKeyboard() {
    focusNode.requestFocus();
  }

  void dismissKeyboard() {
    focusNode.unfocus();
  }
}

/// third Clase for tab page
/// --------------------------------------------------
// ignore: must_be_immutable
class FavoriteListButtonThree extends StatelessWidget {
  FavoriteListButtonThree({
    Key? key,
    required this.context,
    required this.paymentListItems,
    required this.listAccount,
    required this.onClicked,
    required this.animation,
  }) : super(key: key);

  final BuildContext context;
  final ContactItem paymentListItems;
  final List<ContactItem> listAccount;
  final VoidCallback? onClicked;
  final Animation<double> animation;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 3),
        child: Container(
          height: 55,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
              width: 3,
              color: Color(0xFF0C4F83),
            )),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.06,
                  child: paymentListItems.userPhoto,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          paymentListItems.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "DNI: ${paymentListItems.dni}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        //Text(
                        //  "${paymentListItems.name}",
                        //  overflow: TextOverflow.clip,
                        //  maxLines: 1,
                        //  softWrap: false,
                        //),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onClicked,
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// fourth Clase for tab page
/// --------------------------------------------------
// ignore: must_be_immutable
/// fourth Clase for tab page provider prove
/// --------------------------------------------------
// ignore: must_be_immutable
class FavoriteListButtonFourth extends StatefulWidget {
  const FavoriteListButtonFourth({
    Key? key,
    required this.context,
    required this.paymentListItems,
    required this.listAccount,
    required this.onClicked,
    required this.animation,
  }) : super(key: key);

  final BuildContext context;
  final Wallet paymentListItems;
  final List<Wallet> listAccount;
  final VoidCallback? onClicked;
  final Animation<double> animation;

  @override
  State<FavoriteListButtonFourth> createState() => _FavoriteListButtonFourthState();
}

class _FavoriteListButtonFourthState extends State<FavoriteListButtonFourth> {
  int count = 0;

  late FocusNode focusNode;

   @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  //bool enabledButton = false;
  @override
  Widget build(BuildContext context) {
    //totalCoin = totalCoin + coin.coinPartCost;
    //print("si entra $totalCoin");
    return SizeTransition(
      // SlideTransition(
      //position: Tween<Offset>(begin: Offset(-1,0),
      //end: Offset.zero,).animate(CurvedAnimation(parent: animation, curve: Curves.elasticInOut),),
      //key: ValueKey(paymentListItems.type),
      sizeFactor: widget.animation,
      //position: animation,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 3),
        child: Container(
          height: 55,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
              width: 3,
              color: Color(0xFF0C4F83),
            )),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.08,
                child: Text(
                        widget.paymentListItems.name,
                        overflow: TextOverflow.ellipsis,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                  width: MediaQuery.of(context).size.height * 0.08,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(widget.paymentListItems.tokenName),
                      Text(
                        widget.paymentListItems.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                      //Text(
                      //  "${paymentListItems.name}",
                      //  overflow: TextOverflow.clip,
                      //  maxLines: 1,
                      //  softWrap: false,
                      //),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 25,
                child: IconButton(
                  icon: const Icon(Icons.mode_edit_outline_outlined),
                  onPressed: () {
                    context.read<DataProvider>().changeActiveWallet(widget.paymentListItems);
                    //FocusManager.instance.primaryFocus?.unfocus();
                    if (widget.paymentListItems.aciveEnable){
                      debugPrint("show");
                      showKeyboard();
                    }
                    else {
                      debugPrint("dismiss");
                      dismissKeyboard();
                    }
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.02,
              ),
              Expanded(
                child: Theme(
                  // theme added to give a color to the disabled state
                  data: ThemeData(disabledColor: Colors.black),
                  child: TextField(
                    //focusNode: FocusNode(),
                    focusNode: focusNode,
                    cursorColor: Colors.black,
                          decoration: InputDecoration(
                            //enabled: widget.paymentListItems.aciveEnable,
                            //fillColor: Colors.black,
                            //focusColor: Colors.black,
                            //hoverColor: Colors.black,
                            //iconColor: Colors.black,
                            labelText: widget.paymentListItems.tokenAddress,
                            hintMaxLines: 2,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            hintStyle: const TextStyle(color: Colors.black),
                            //floatingLabelAlignment: FloatingLabelAlignment.center,
                            //floatingLabelStyle: TextStyle(color: Colors.green),
                            //border: InputBorder.none
                          ),
                          onSubmitted: (value){
                      context.read<DataProvider>().changeActiveWallet(widget.paymentListItems);
                      } ,
                          style: const TextStyle(color: Colors.black,overflow: TextOverflow.ellipsis,)
                        ),
                ),
               //Text(
               //  paymentListItems.tokenAddress,
               //  overflow: TextOverflow.ellipsis,
               //  maxLines: 2,
               //),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.02,
              ),
              IconButton(
                onPressed: widget.onClicked,
                //()=>showDialog<String>(context: context, builder:(BuildContext context) => AlertDialog(
                //          content: SizedBox(
                //            height: MediaQuery.of(context).size.height * 0.15,
                //            child: const Text(
                //                "Esta seguro que desea eliminar esta cuenta."),
                //          ),
                //          actions: <Widget>[
                //            TextButton(
                //              onPressed: () {
                //                Navigator.pop(context);
                //              },
                //              child: const Text(
                //                'Cancel',
                //                style: TextStyle(
                //                  color: Color(0XFF154579),
                //                ),
                //              ),
                //            ),
                //            TextButton(
                //              onPressed: onClicked,
                //              child: const Text(
                //                'OK',
                //                style: TextStyle(
                //                  color: Color(0XFF154579),
                //                ),
                //              ),
                //            ),
                //          ],
                //        ),),
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showKeyboard() {
    focusNode.requestFocus();
  }

  void dismissKeyboard() {
    focusNode.unfocus();
  }
}
/// fifth Clase for tab page
/// --------------------------------------------------
// ignore: must_be_immutable
/// fifth Clase for tab page provider prove
/// --------------------------------------------------
// ignore: must_be_immutable
class FavoriteListButtonFifth extends StatefulWidget {
  const FavoriteListButtonFifth({
    Key? key,
    required this.context,
    required this.paymentListItems,
    required this.listAccount,
    required this.onClicked,
    required this.animation,
  }) : super(key: key);

  final BuildContext context;
  final Wallet paymentListItems;
  final List<Wallet> listAccount;
  final VoidCallback? onClicked;
  final Animation<double> animation;

  @override
  State<FavoriteListButtonFifth> createState() => _FavoriteListButtonFifthState();
}

class _FavoriteListButtonFifthState extends State<FavoriteListButtonFifth> {
  int count = 0;

  late FocusNode focusNode;

   @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  //bool enabledButton = false;
  @override
  Widget build(BuildContext context) {
    //totalCoin = totalCoin + coin.coinPartCost;
    //print("si entra $totalCoin");
    return SizeTransition(
      // SlideTransition(
      //position: Tween<Offset>(begin: Offset(-1,0),
      //end: Offset.zero,).animate(CurvedAnimation(parent: animation, curve: Curves.elasticInOut),),
      //key: ValueKey(paymentListItems.type),
      sizeFactor: widget.animation,
      //position: animation,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 3),
        child: Container(
          height: 55,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
              width: 3,
              color: Color(0xFF0C4F83),
            )),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.08,
                child: Text(
                        widget.paymentListItems.name,
                        overflow: TextOverflow.ellipsis,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                  width: MediaQuery.of(context).size.height * 0.08,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(widget.paymentListItems.tokenName),
                      Text(
                        widget.paymentListItems.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                      //Text(
                      //  "${paymentListItems.name}",
                      //  overflow: TextOverflow.clip,
                      //  maxLines: 1,
                      //  softWrap: false,
                      //),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 25,
                child: IconButton(
                  icon: const Icon(Icons.mode_edit_outline_outlined),
                  onPressed: () {
                    context.read<DataProvider>().changeActiveWallet(widget.paymentListItems);
                    //FocusManager.instance.primaryFocus?.unfocus();
                    if (widget.paymentListItems.aciveEnable){
                      debugPrint("show");
                      showKeyboard();
                    }
                    else {
                      debugPrint("dismiss");
                      dismissKeyboard();
                    }
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.02,
              ),
              Expanded(
                child: Theme(
                  // theme added to give a color to the disabled state
                  data: ThemeData(disabledColor: Colors.black),
                  child: TextField(
                    //focusNode: FocusNode(),
                    focusNode: focusNode,
                    cursorColor: Colors.black,
                          decoration: InputDecoration(
                            //enabled: widget.paymentListItems.aciveEnable,
                            //fillColor: Colors.black,
                            //focusColor: Colors.black,
                            //hoverColor: Colors.black,
                            //iconColor: Colors.black,
                            labelText: widget.paymentListItems.tokenAddress,
                            hintMaxLines: 2,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            hintStyle: const TextStyle(color: Colors.black),
                            //floatingLabelAlignment: FloatingLabelAlignment.center,
                            //floatingLabelStyle: TextStyle(color: Colors.green),
                            //border: InputBorder.none
                          ),
                          onSubmitted: (value){
                      context.read<DataProvider>().changeActiveWallet(widget.paymentListItems);
                      } ,
                          style: const TextStyle(color: Colors.black,overflow: TextOverflow.ellipsis,)
                        ),
                ),
               //Text(
               //  paymentListItems.tokenAddress,
               //  overflow: TextOverflow.ellipsis,
               //  maxLines: 2,
               //),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.02,
              ),
              IconButton(
                onPressed: widget.onClicked,
                //()=>showDialog<String>(context: context, builder:(BuildContext context) => AlertDialog(
                //          content: SizedBox(
                //            height: MediaQuery.of(context).size.height * 0.15,
                //            child: const Text(
                //                "Esta seguro que desea eliminar esta cuenta."),
                //          ),
                //          actions: <Widget>[
                //            TextButton(
                //              onPressed: () {
                //                Navigator.pop(context);
                //              },
                //              child: const Text(
                //                'Cancel',
                //                style: TextStyle(
                //                  color: Color(0XFF154579),
                //                ),
                //              ),
                //            ),
                //            TextButton(
                //              onPressed: onClicked,
                //              child: const Text(
                //                'OK',
                //                style: TextStyle(
                //                  color: Color(0XFF154579),
                //                ),
                //              ),
                //            ),
                //          ],
                //        ),),
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showKeyboard() {
    focusNode.requestFocus();
  }

  void dismissKeyboard() {
    focusNode.unfocus();
  }
}