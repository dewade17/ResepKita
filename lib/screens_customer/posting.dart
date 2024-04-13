import 'package:flutter/material.dart';

class Posting extends StatefulWidget {
  const Posting({Key? key}) : super(key: key);

  @override
  _PostingState createState() => _PostingState();
}

class _PostingState extends State<Posting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Posting Resep',
      //   ),
      //   backgroundColor: Colors.blue,
      // ),
      body: Column(
        children: [Text("test")],
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 270,
      decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: Color(0xFF0988B5), // Warna bayangan
          //     spreadRadius: 5, // Radius penyebaran bayangan
          //     blurRadius: 7, // Radius blur bayangan
          //     offset: Offset(0, 3), // Offset bayangan (dx, dy)
          //   ),
          // ],
          color: const Color(0xFF0988B5).withOpacity(0.19),
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: Colors.black)),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal:
                    10), // Menambahkan jarak 20 pada kedua sisi horizontal
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("ID Pesanan :"),
                    Container(
                      width: 120,
                      height: 30,
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
                      child: const Center(
                        // Menggunakan Center widget di sekitar Text widget
                        child: Text(
                          "986783836258",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Mobile Legends 20 Diamonds"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tujuan"),
                          Text("1998202893"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Harga"),
                          Text("Rp. 40.000"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Harga"),
                          Text("Rp. 40.000"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tanggal"),
                          Text("13 Februari 2023 (18.96 WITA)"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
