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
    var totalWidth = MediaQuery.of(context).size.width;
    return SizeTransition(
      // SlideTransition(
      //position: Tween<Offset>(begin: Offset(-1,0),
      //end: Offset.zero,).animate(CurvedAnimation(parent: animation, curve: Curves.elasticInOut),),
      //key: ValueKey(paymentListItems.type),
      sizeFactor: animation,
      //position: animation,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            // border: Border(
            //     bottom: BorderSide(
            //   width: 3,
            //   color: Color(0xFF0C4F83),
            // )),
            border: Border.all(color: const Color(0xff3C3C3B), width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
                BoxShadow(
                  color: Color(0xff7D7676),
                  offset: Offset(-1,2),
                  blurRadius: 5,
                  blurStyle: BlurStyle.normal,
                ),
              ],
          ),
          child: Padding(
            padding: EdgeInsets.only(left: totalWidth*0.025),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: totalWidth*0.3,
                  child: Text(paymentListItems.name,maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 11),),),
                SizedBox(
                  width: totalWidth*0.2,
                  child: Text(paymentListItems.code,
                    overflow: TextOverflow.ellipsis,maxLines:1),
                ),
                SizedBox(
                  width: totalWidth*0.2,
                  child: Text(paymentListItems.code,
                    overflow: TextOverflow.ellipsis,maxLines:1),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
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
                  icon: const Icon(Icons.cancel_outlined),
                ),
              ],
            ),
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
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            // border: Border(
            //     bottom: BorderSide(
            //   width: 3,
            //   color: Color(0xFF0C4F83),
            // )),
            border: Border.all(color: const Color(0xff3C3C3B), width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
                BoxShadow(
                  color: Color(0xff7D7676),
                  offset: Offset(-1,2),
                  blurRadius: 5,
                  blurStyle: BlurStyle.normal,
                ),
              ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 25,
                child: Image.asset(
                  widget.paymentListItems.tokenLogo,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.paymentListItems.tokenName == 'Bitcoin' ? "BTC" : "KEKW",
                        overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 11),
                      ),
                      Text(
                        widget.paymentListItems.name,
                        overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 11),
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
              SizedBox(width: 10,),
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
                icon: const Icon(Icons.cancel_outlined),
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

/// second Clase for tab page for real
/// --------------------------------------------------
//class FavoriteListButtonTwo extends StatelessWidget {
//  FavoriteListButtonTwo({
//    Key? key,
//    required this.context,
//    required this.paymentListItems,
//    required this.listAccount,
//    required this.onClicked,
//    required this.animation,
//  }) : super(key: key);
//
//  final BuildContext context;
//  final BillItem paymentListItems;
//  final List<BillItem> listAccount;
//  final VoidCallback? onClicked;
//  final Animation<double> animation;
//  int count = 0;
//
//  @override
//  Widget build(BuildContext context) {
//    //totalCoin = totalCoin + coin.coinPartCost;
//    //print("si entra $totalCoin");
//    return SizeTransition(
//      // SlideTransition(
//      //position: Tween<Offset>(begin: Offset(-1,0),
//      //end: Offset.zero,).animate(CurvedAnimation(parent: animation, curve: Curves.elasticInOut),),
//      //key: ValueKey(paymentListItems.type),
//      sizeFactor: animation,
//      //position: animation,
//      child: Padding(
//        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 3),
//        child: Container(
//          height: 55,
//          decoration: const BoxDecoration(
//            color: Colors.white,
//            border: Border(
//                bottom: BorderSide(
//              width: 3,
//              color: Color(0xFF0C4F83),
//            )),
//          ),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.start,
//            children: [
//              SizedBox(
//                width: MediaQuery.of(context).size.height * 0.01,
//              ),
//              SizedBox(
//                width: MediaQuery.of(context).size.height * 0.035,
//                child: paymentListItems.coinIcon,
//              ),
//              Padding(
//                padding: const EdgeInsets.symmetric(horizontal: 8),
//                child: SizedBox(
//                  width: MediaQuery.of(context).size.height * 0.08,
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    children: [
//                      Text("${paymentListItems.coin}"),
//                      Text(
//                        "${paymentListItems.name}",
//                        overflow: TextOverflow.ellipsis,
//                      ),
//                      //Text(
//                      //  "${paymentListItems.name}",
//                      //  overflow: TextOverflow.clip,
//                      //  maxLines: 1,
//                      //  softWrap: false,
//                      //),
//                    ],
//                  ),
//                ),
//              ),
//              SizedBox(
//                width: MediaQuery.of(context).size.height * 0.02,
//              ),
//              Expanded(
//                child: Text("${paymentListItems.bill}"),
//              ),
//              SizedBox(
//                width: MediaQuery.of(context).size.height * 0.02,
//              ),
//              IconButton(
//                onPressed: onClicked,
//                //()=>showDialog<String>(context: context, builder:(BuildContext context) => AlertDialog(
//                //          content: SizedBox(
//                //            height: MediaQuery.of(context).size.height * 0.15,
//                //            child: const Text(
//                //                "Esta seguro que desea eliminar esta cuenta."),
//                //          ),
//                //          actions: <Widget>[
//                //            TextButton(
//                //              onPressed: () {
//                //                Navigator.pop(context);
//                //              },
//                //              child: const Text(
//                //                'Cancel',
//                //                style: TextStyle(
//                //                  color: Color(0XFF154579),
//                //                ),
//                //              ),
//                //            ),
//                //            TextButton(
//                //              onPressed: onClicked,
//                //              child: const Text(
//                //                'OK',
//                //                style: TextStyle(
//                //                  color: Color(0XFF154579),
//                //                ),
//                //              ),
//                //            ),
//                //          ],
//                //        ),),
//                icon: const Icon(Icons.delete),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}

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
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            // border: Border(
            //     bottom: BorderSide(
            //   width: 3,
            //   color: Color(0xFF0C4F83),
            // )),
            border: Border.all(color: const Color(0xff3C3C3B), width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
                BoxShadow(
                  color: Color(0xff7D7676),
                  offset: Offset(-1,2),
                  blurRadius: 5,
                  blurStyle: BlurStyle.normal,
                ),
              ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 35,
                  child: CircleAvatar(backgroundImage: paymentListItems.userPhoto.image),
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
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "DNI: ${paymentListItems.dni}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 12,
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
                  icon: const Icon(Icons.cancel_outlined),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
