import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:temu_interceptor/box/adapters.dart';
import 'package:temu_interceptor/temu_interceptor_tester.dart';

import 'navigation/navigator.dart';
import 'notification/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initAdapters();
  await NotificationService().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
const DarwinNotificationDetails iOSPlatformChannelSpecifics = DarwinNotificationDetails(
  presentAlert: false,
  presentBadge: false,
  presentSound: false,
  subtitle: "Hello",
);

const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
  'Hello 1',
  'Hello 2',
  actions: <AndroidNotificationAction>[
    AndroidNotificationAction('open', 'Tap to open logs'),
  ],
);

const NotificationDetails androidPlatformChannelSpecifics =
    NotificationDetails(android: androidNotificationDetails);

const NotificationDetails iosPlatformChannelSpecifics =
    NotificationDetails(iOS: iOSPlatformChannelSpecifics);

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          TemuInterceptorTester().test();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
