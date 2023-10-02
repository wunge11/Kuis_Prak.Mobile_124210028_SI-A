import 'package:flutter/material.dart';
import 'package:tes_modul4/halaman_utama.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Kuis Prak. Mobile',
      debugShowCheckedModeBanner: false,
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        primarySwatch: Colors.blueGrey,
      ),
      // A widget which will be started on application startup
      //home: LoginPage(),
      home: HalamanUtama(),
    );
  }
}
