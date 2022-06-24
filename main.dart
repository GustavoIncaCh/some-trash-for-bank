import 'package:bank9780/assets/data_list/list_visitor_page.dart';
import 'package:bank9780/components/pages/home_page.dart';
import 'package:bank9780/components/pages/loading_page.dart';
import 'package:bank9780/modules/general/enum.dart';
import 'package:bank9780/modules/provider/client_provider.dart';
import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/modules/provider/menu_provider.dart';
import 'package:bank9780/modules/provider/operation_provider.dart';
import 'package:bank9780/modules/provider/user_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';

import 'package:provider/provider.dart';
//import 'package:socket_io/socket_io.dart';

import 'modules/general/button_class.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Permission.camera.request();
  await Permission.microphone.request();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(fcmToken);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  print('Got a message whilst in the foreground!');
  print('Message data: ${message.data}');

  if (message.notification != null) {
    print('Message also contained a notification: ${message.notification}');
  }
});

  print('User granted permission: ${settings.authorizationStatus}');
  

  //WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(supportedLocales: [
    Locale(Languages.es.name), // Spanish language
    Locale(Languages.pt.name), // portuguese language
  ], path: 'lib/assets/translations', child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => DataProvider()),
          ChangeNotifierProvider(create: (context) => ClientProvider()),
          ChangeNotifierProvider(create: (context) => UserProvider()),
          ChangeNotifierProvider(create: (context) => MenuProvider()),
          ChangeNotifierProvider(create: (context) => VisitorProvider()),
          ChangeNotifierProvider(create: (context) => ItemMenus()),
          ChangeNotifierProvider(create: (context) => OperationProvider())
        ],
        child: MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            //localizationsDelegates      : null,
            //supportedLocales            : <Locale>[Locale('es','PE')],
            //locale                      : Locale('es','PE'),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const LoadingPage()));
  }
}
