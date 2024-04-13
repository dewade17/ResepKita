import 'package:flutter/material.dart';
import 'package:my_projek/components/asset_image_widget.dart';
import 'package:my_projek/screens_customer/negara%20_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Profile',
      //   ),
      //   backgroundColor: Colors.blue,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.centerLeft, // Mengatur teks ke kiri
                child: Text(
                  "Welcome Back !!!, Dewa Arsana",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily:
                          'poppins'), // Sesuaikan ukuran teks sesuai kebutuhan
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.blue, // Warna border
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.person),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('Dewa Arsana'), Text("ID: 2215019041")],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                // Navigasi ke halaman lain di sini
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NegaraScreen(),
                  ),
                );
              },
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.blue, // Warna border
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Negara"),
                      Row(
                        children: [
                          Text("Indonesia"),
                          SizedBox(
                            width: 13,
                          ),
                          Hero(
                            tag: 'flagImage',
                            child: AssetImageWidget(
                              imagePath: 'assets/image/Indonesia.png',
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.blue, // Warna border
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Kebijakan Privasi")],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.blue, // Warna border
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Ketentuan Pemakaian")],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.blue, // Warna border
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Hubungi Kami")],
                ),
              ),
            ),
            // Menambahkan lebih banyak widget di sini jika diperlukan
          ],
        ),
      ),
    );
  }
}

class ProfileScreen2 extends StatelessWidget {
  const ProfileScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('test'));
  }
}
