import './pages/start_up.dart';
import './pages/login.dart';
import './pages/home.dart';
import './pages/home/detail.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import './provides/user_info.dart';
import './provides/list.dart';
void main(){
  var userPervide = UserProvide();
  var dengList = DengList();
  var providers = Providers()
    ..provide(Provider<UserProvide>.value(userPervide))
    ..provide(Provider<DengList>.value(dengList));
  runApp(ProviderNode(providers: providers, child: MyApp(),));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '路灯管理',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor:  Color.fromRGBO(45,41,63, 1),
      ),
      home: StartUp(),
      routes: <String, WidgetBuilder>{
        '/login': (context) => Login(),
        '/home': (context) => Home(),
        // '/detail': (context) => Detail(),
      },
    );
  }
}
