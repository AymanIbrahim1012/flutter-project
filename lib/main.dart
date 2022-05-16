import 'package:flutterproject/screens/adviser/home_adviser_screen.dart';
import 'package:flutterproject/screens/adviser/student_requests_screen.dart';
import 'package:flutterproject/screens/chat/chat_screen.dart';
import 'package:flutterproject/screens/manger/home_screen.dart';
import 'package:flutterproject/screens/student/CS.dart';
import 'package:flutterproject/screens/student/Choose_type_screen.dart';
import 'package:flutterproject/screens/student/IS.dart';
import 'package:flutterproject/screens/student/IT.dart';
import 'package:flutterproject/screens/student/chat_adviser.dart';
import 'package:flutterproject/screens/student/guide_data_screen.dart';
import 'package:flutterproject/screens/student/settings_screen.dart';
import 'package:flutterproject/screens/student/home_screen.dart';
import 'package:flutterproject/screens/student/study_plan_screeen.dart';
import 'package:flutterproject/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'graduates/request_chance_screen.dart';
import 'graduates/request_in_progress.dart';
import 'notification/push_notification_service.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/splash_screen.dart';

late FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
late AndroidNotificationChannel? channel;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      // 'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values); //add this line
    return MaterialApp(
      title: 'E-visor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomePage(),
        '/splash': (context) =>  SplashScreen(),
        '/welcome':(context) =>  WelcomePage(),
        // '/login':(context) =>  Login(),
       '/login': (context) => LoginPage(),
        '/signup' :(context) => SignupPage(),
        //*****************************///////
        '/HomeStudentPage' :(context) => HomeStudentPage(),
        '/chooseType' :(context) => ChooseType(),
        '/studyPlanPage' :(context) => StudyPlanPage(),
        '/CS' :(context) => CS(),
        '/IS' :(context) => IS(),
        '/IT' :(context) => IT(),
        '/guideDataPage' :(context) => GuideDataPage(),
        '/AdviserChatPage' :(context) => AdviserChatPage(),
        '/settingsPage' :(context) => SettingsPage(),
        //**********************************///
        '/requestAChance' :(context) => RequestAChance(),
        '/requestInProgress' :(context) => RequestInProgress(),
        //**********************************//
        '/homeAdviserPage' :(context) => HomeAdviserPage(),
        '/chatScreen' :(context) => ChatScreen(),
        '/followUpStudentRequests' :(context) => FollowUpStudentRequests(),
        '/followUpAdviserRequests' :(context) => FollowUpAdviserRequests(),

      },
    );
  }
}

