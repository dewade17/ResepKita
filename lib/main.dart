import 'package:flutter/material.dart';
import 'package:my_projek/customer_service/customer_screen.dart';
import 'package:my_projek/datas_screen/datas_screen.dart';
import 'package:my_projek/divisi_screen/screen_divisi.dart';
// ignore: unused_import
import 'package:my_projek/screens/login_screen.dart';

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
          '/customer-screen': (context) => const CustomerScreen(),
          '/divison-screen': (context) => const ScreenDivisi(),
        });
  }
}
