// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:my_projek/components/asset_image_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Resep.Kita',
      //   ),
      //   backgroundColor: Colors.blue,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF32323e), // Warna latar belakang
                // Jika Anda ingin menggunakan gambar sebagai latar belakang:
                // image: DecorationImage(
                //   image: AssetImage('assets/background_image.jpg'),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 25 / 10,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: [
                  Container(
                    margin: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const AssetImageWidget(
                        imagePath: 'assets/image/ramdhan2024.png'),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const AssetImageWidget(
                        imagePath: 'assets/image/banner3.jpeg'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Spasi setelah CarouselSlider
            MyStatelessWidget(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.blue, // Warna border
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    // Handle search query changes here
                    print('Search query: $value');
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Handle search button press here
                  print('Search button pressed');
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height:
              30, // Mengatur tinggi kontainer untuk baris kontainer selanjutnya
          child: ListView(
            // Menggunakan ListView untuk memungkinkan penggeseran horizontal
            scrollDirection:
                Axis.horizontal, // Menetapkan arah gulir ke horizontal
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal:
                        5), // Memberikan spasi horizontal antara kontainer
                width: 110,
                decoration: BoxDecoration(
                    // boxShadow: [
                    //   // BoxShadow(
                    //   //   // color: Color(0xFF0988B5), // Warna bayangan
                    //   //   spreadRadius: 5, // Radius penyebaran bayangan
                    //   //   blurRadius: 7, // Radius blur bayangan
                    //   //   offset: Offset(0, 3), // Offset bayangan (dx, dy)
                    //   // ),
                    // ],
                    color: const Color(0xFF0988B5).withOpacity(0.19),
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: Colors.black)),
                child: const Center(child: Text("Favorite")),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal:
                        5), // Memberikan spasi horizontal antara kontainer
                width: 150,
                decoration: BoxDecoration(
                    // boxShadow: [
                    //   // BoxShadow(
                    //   //   // color: Color(0xFF0988B5), // Warna bayangan
                    //   //   spreadRadius: 5, // Radius penyebaran bayangan
                    //   //   blurRadius: 7, // Radius blur bayangan
                    //   //   offset: Offset(0, 3), // Offset bayangan (dx, dy)
                    //   // ),
                    // ],
                    color: const Color(0xFF0988B5).withOpacity(0.19),
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: Colors.black)),
                child: const Center(child: Text("Terbaru")),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal:
                        5), // Memberikan spasi horizontal antara kontainer
                width: 150,
                decoration: BoxDecoration(
                    // boxShadow: [
                    //   // BoxShadow(
                    //   //   // color: Color(0xFF0988B5), // Warna bayangan
                    //   //   spreadRadius: 5, // Radius penyebaran bayangan
                    //   //   blurRadius: 7, // Radius blur bayangan
                    //   //   offset: Offset(0, 3), // Offset bayangan (dx, dy)
                    //   // ),
                    // ],
                    color: const Color(0xFF0988B5).withOpacity(0.19),
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: Colors.black)),
                child: const Center(child: Text("Fresh")),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Container(
              width: 300,
              height: 255,
              decoration: BoxDecoration(
                // boxShadow: [
                //   // BoxShadow(
                //   //   // color: Color(0xFF0988B5), // Warna bayangan
                //   //   spreadRadius: 5, // Radius penyebaran bayangan
                //   //   blurRadius: 7, // Radius blur bayangan
                //   //   offset: Offset(0, 3), // Offset bayangan (dx, dy)
                //   // ),
                // ],
                color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.19),
                borderRadius: BorderRadius.circular(9),
                border: Border.all(color: Colors.black),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 203, 203, 203)
                        .withOpacity(0.5), // Warna bayangan
                    spreadRadius: 5, // Jarak penyebaran bayangan
                    blurRadius: 7, // Radius blur bayangan
                    offset: Offset(
                        0, 3), // Perubahan offset bayangan dalam (dx, dy)
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Balinda Menerbitkan"),
                      Text("17 Menit yang lalu")
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AssetImageWidget(
                    imagePath: 'assets/foto_produk/Sayur_Asem.jpe',
                    width: 300,
                    height: 130,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft, // Mengatur teks ke kiri
                      child: Text(
                        "Sayur Asem Enak Poll!!!",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily:
                                'poppins'), // Sesuaikan ukuran teks sesuai kebutuhan
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.favorite_border),
                      Icon(Icons.bookmark_add_outlined),
                      Icon(Icons.share_outlined)
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 255,
              decoration: BoxDecoration(
                // boxShadow: [
                //   // BoxShadow(
                //   //   // color: Color(0xFF0988B5), // Warna bayangan
                //   //   spreadRadius: 5, // Radius penyebaran bayangan
                //   //   blurRadius: 7, // Radius blur bayangan
                //   //   offset: Offset(0, 3), // Offset bayangan (dx, dy)
                //   // ),
                // ],
                color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.19),
                borderRadius: BorderRadius.circular(9),
                border: Border.all(color: Colors.black),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 203, 203, 203)
                        .withOpacity(0.5), // Warna bayangan
                    spreadRadius: 5, // Jarak penyebaran bayangan
                    blurRadius: 7, // Radius blur bayangan
                    offset: Offset(
                        0, 3), // Perubahan offset bayangan dalam (dx, dy)
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Balinda Menerbitkan"),
                      Text("17 Menit yang lalu")
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AssetImageWidget(
                    imagePath: 'assets/foto_produk/Sayur_Asem.jpe',
                    width: 300,
                    height: 130,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft, // Mengatur teks ke kiri
                      child: Text(
                        "Sayur Asem Enak Poll!!!",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily:
                                'poppins'), // Sesuaikan ukuran teks sesuai kebutuhan
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.favorite_border),
                      Icon(Icons.bookmark_add_outlined),
                      Icon(Icons.share_outlined)
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
