import 'package:bank9780/modules/general/button_class.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    Key? key,
    required this.context,
    required this.dateFormat,
    required this.notificationItems,
  }) : super(key: key);

  final BuildContext context;
  final DateFormat dateFormat;
  final NotificationItem notificationItems;

  @override
  Widget build(BuildContext context) {
    //totalCoin = totalCoin + coin.coinPartCost;
    //print("si entra $totalCoin");
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      height: 115,
      decoration: const BoxDecoration(
        //color        : Colors.white,
        //borderRadius : const BorderRadius.all(Radius.circular(10)),
        border: Border(
          bottom: BorderSide(
            width: 2.0,
            color: Color(0xFF154579),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
              child: const Icon(
                Icons.lock_clock,
                size: 40,
                color: Color(0xFF154579),
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  notificationItems.text,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: false,
                ),
                RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  softWrap: false,
                  text: TextSpan(
                    text: notificationItems.url,
                    style: const TextStyle(
                      color: Color(0xFF4249E5),
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launch(
                            'https://www.google.com');
                      },
                  ),
                  //Text(
                  //  "${notificationItems.url}",
                  //  overflow: TextOverflow.ellipsis,
                  //  maxLines: 3,
                  //  softWrap: false,
                  //),
                ),
                Text(
                  dateFormat.format(notificationItems.date),
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
