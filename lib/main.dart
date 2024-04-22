import 'package:flutter/material.dart';
import 'package:my_projek/datas_screen/datas_screen.dart';
// ignore: unused_import
import 'package:my_projek/screens/login_screen.dart'; // Import halaman login

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // Tentukan halaman awal aplikasi sebagai halaman login
        home: Login(), // Mengarahkan ke halaman login
        routes: {
          '/datas-screen': (context) => const DatasScreen(),
        });
  }
}
