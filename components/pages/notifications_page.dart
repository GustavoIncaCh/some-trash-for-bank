import 'package:bank9780/assets/data_list/list_notification.dart';
import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/components/widgets/modals/notification_list_modal.dart';
import 'package:bank9780/modules/general/button_class.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

//DateFormat dateFormat = DateFormat('EEEE d MMMM yyyy HH:mm:ss');

class NotificactionsPage extends StatefulWidget {
  const NotificactionsPage({Key? key}) : super(key: key);

  @override
  State<NotificactionsPage> createState() => _NotificactionsPageState();
}

class _NotificactionsPageState extends State<NotificactionsPage> {
  late List<NotificationItem> notificationItems;
  late DateFormat dateFormat;

  @override
  void initState() {
    super.initState();
    notificationItems = allNotifications;
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMEEEEd('es');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        appBarName: 'NOTIFICACIONES', isInside: false,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.75,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: const BoxDecoration(
            //color        : Colors.white,
            //borderRadius : const BorderRadius.all(Radius.circular(10)),
            border: Border(
              top: BorderSide(
                width: 2.0,
                color: Color(0xFF154579),
              ),
              //bottom: BorderSide(
              //  width: 2.0,
              //  color: Color(0xFF154579),
              //),
            ),
          ),
          child: ListView.builder(
            itemCount: notificationItems.length,
            itemBuilder: (context, index) {
              final notification = notificationItems[index];

              /// create the items of the list
              return NotificationButton(
                context: context,
                dateFormat: dateFormat,
                notificationItems: notification,
              );
            },
          ),
        ),
      ),
    );
  }
}
