import 'package:bank9780/modules/general/button_class.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class HistoryButton extends StatelessWidget {
  const HistoryButton({
    Key? key,
    required this.context,
    required this.dateFormat,
    required this.historyItems,
    required this.controller,
  }) : super(key: key);

  final BuildContext context;
  final DateFormat dateFormat;
  final HistoryItem historyItems;
  final ExpandableController controller;


 // @override
 // void initState() {
 //   super.initState();
 //   dateFormat=
 // }

  @override
  Widget build(BuildContext context) {
    
  //var dateFormat = DateFormat.yMEd('es');
  var dateFormat = DateFormat.yMMMMd('ES');
    //totalCoin = totalCoin + coin.coinPartCost;
    //print("si entra $totalCoin");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 125,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.5,
            color: const Color(0xFF0C4F83),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.025,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 65,
                        child: Text(
                          "Tipo:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text(historyItems.name),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 65,
                        child: Text(
                          "Fecha:", overflow: TextOverflow.ellipsis,maxLines: 1,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text(dateFormat.format(historyItems.date) , overflow: TextOverflow.ellipsis,maxLines: 1,),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 65,
                        child: Text(
                          "Monto:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text("${historyItems.coinAmount}"),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 65,
                        child: Text(
                          "Estado:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text(historyItems.state),
                    ],
                  ),
                ],
              ),
            ),
            //Expanded(
            //  child: Column(
            //    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //    crossAxisAlignment: CrossAxisAlignment.start,
            //    children: [
            //    ],
            //  ),
            //),
            SizedBox(
              width: 75,
              child: TextButton(
                onPressed: () {
                  controller.toggle();
                },
                child: const Icon(
                  Icons.remove_red_eye,
                  color: Color(0XFF154579),
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HistoryButtonExpanded extends StatelessWidget {
  const HistoryButtonExpanded({
    Key? key,
    required this.context,
    required this.dateFormat,
    required this.historyItems,
    required this.controller,
  }) : super(key: key);

  final BuildContext context;
  final DateFormat dateFormat;
  final HistoryItem historyItems;
  final ExpandableController controller;

  @override
  Widget build(BuildContext context) {
  //var dateFormat = DateFormat.yMEd();
  var dateFormat = DateFormat.yMMMMd('ES');
    //totalCoin = totalCoin + coin.coinPartCost;
    //print("si entra $totalCoin");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 175,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.5,
            color: const Color(0xFF0C4F83),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.025,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 65,
                        child: Text(
                          "Tipo:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text(historyItems.name),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 65,
                        child: Text(
                          "Fecha:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text(dateFormat.format(historyItems.date) , overflow: TextOverflow.ellipsis,maxLines: 1,),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 65,
                        child: Text(
                          "Monto:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text("${historyItems.coinAmount}"),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 65,
                        child: Text(
                          "Estado:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text(historyItems.state),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 65,
                        child: Text(
                          "Destino:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text("${historyItems.coinAmount}"),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 65,
                        child: Text(
                          "Comisión:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text(historyItems.state),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 75,
                  child: TextButton(
                    onPressed: () {
                      controller.toggle();
                    },
                    child: const Icon(
                      Icons.remove_red_eye,
                      color: Color(0XFF154579),
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(height: 50,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
