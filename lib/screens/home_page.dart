// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:my_projek/mahasiswa/mahasiswa_screen.dart';
import 'package:my_projek/masakan/masakan_screen.dart';
import 'package:my_projek/screens_customer/detail_search.dart';
// import 'package:my_projek/screens_customer/event_screen.dart';
import 'package:my_projek/screens_customer/home_screen.dart';
import 'package:my_projek/screens_customer/profile_screen.dart';
// import 'package:my_projek/screens_customer/profile_screen.dart';
// import 'package:my_projek/screens_customer/setting_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:my_projek/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Screen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const MasakanScreen(),
    const DetailSearch(),
    const ProfileScreen(),
    // const SettingScreen(),
    // const ProfileScreen(),
  ];

  final List<String> _appBarTitles = const [
    'Resep.Kita',
    'Posting.Resep',
    'Search.Resep',
    'Profile',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_appBarTitles[_selectedIndex]),
          backgroundColor: Colors.blue,
        ),
        body: _screens[_selectedIndex],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Constants.scaffoldBackgroundColor,
          buttonBackgroundColor: Constants.primaryColor,
          items: <Widget>[
            Icon(
              Icons.home,
              size: 30.0,
              color: _selectedIndex == 0 ? Colors.white : Constants.activeMenu,
            ),
            Icon(
              Icons.add,
              size: 30.0,
              color: _selectedIndex == 1 ? Colors.white : Constants.activeMenu,
            ),
            Icon(
              Icons.search,
              size: 30.0,
              color: _selectedIndex == 2 ? Colors.white : Constants.activeMenu,
            ),
            Icon(
              Icons.person,
              size: 30.0,
              color: _selectedIndex == 3 ? Colors.white : Constants.activeMenu,
            ),
          ],
          onTap: _onItemTapped,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Resep.Kita',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  _onItemTapped(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_emergency_outlined),
                title: Text('Mahasiswa'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MahasiswaScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.food_bank),
                title: Text('Makanan'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MasakanScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  _onItemTapped(2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ));
  }
}
