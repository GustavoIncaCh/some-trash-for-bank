import 'package:push_notification/push_notification.dart';

showPushNotificationWidget({
  required int order,
  required String title,
  required String message,
}) async {
  Notificator notification = Notificator(
    onPermissionDecline: () {
// ignore: avoid_print
      print('permission decline');
    },
    onNotificationTapCallback: (notificationData) {},
  )..requestPermissions(
      requestSoundPermission: true,
      requestAlertPermission: true,
    );

  String notificationKey = 'key';

  notification.show(
    order,
    title,
    message,
   data: {notificationKey: '[notification data]'},
   notificationSpecifics: NotificationSpecifics(
     AndroidNotificationSpecifics(
       //color: '17170453',
       //icon: 'logo',
       autoCancelable: true,
     ),
   ),
  );
}
