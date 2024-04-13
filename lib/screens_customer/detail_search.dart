import 'package:flutter/material.dart';

class DetailSearch extends StatefulWidget {
  const DetailSearch({Key? key}) : super(key: key);

  @override
  _DetailSearchState createState() => _DetailSearchState();
}

class _DetailSearchState extends State<DetailSearch> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Container(
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
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Bahan populer di Bulan Ramadhan",
              style: TextStyle(fontFamily: 'poppins', fontSize: 19),
            ),
            SizedBox(
              height: 15,
            ),
            Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                            width: 150,
                            height: 100,
                            decoration: BoxDecoration(
                                // boxShadow: [
                                //   // BoxShadow(
                                //   //   // color: Color(0xFF0988B5), // Warna bayangan
                                //   //   spreadRadius: 5, // Radius penyebaran bayangan
                                //   //   blurRadius: 7, // Radius blur bayangan
                                //   //   offset: Offset(0, 3), // Offset bayangan (dx, dy)
                                //   // ),
                                // ],
                                color:
                                    const Color(0xFF0988B5).withOpacity(0.19),
                                borderRadius: BorderRadius.circular(9),
                                border: Border.all(color: Colors.black),
                                image: DecorationImage(
                                    image: AssetImage("assets/image/ikan.png"),
                                    fit: BoxFit.cover)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Ikan",
                                  style: TextStyle(
                                    // color: Colors.white,
                                    fontFamily: 'poppins',
                                    fontSize: 20,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 1.2
                                      ..color = const Color.fromARGB(
                                          221, 255, 255, 255),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            width: 150,
                            height: 100,
                            decoration: BoxDecoration(
                                // boxShadow: [
                                //   // BoxShadow(
                                //   //   // color: Color(0xFF0988B5), // Warna bayangan
                                //   //   spreadRadius: 5, // Radius penyebaran bayangan
                                //   //   blurRadius: 7, // Radius blur bayangan
                                //   //   offset: Offset(0, 3), // Offset bayangan (dx, dy)
                                //   // ),
                                // ],
                                color:
                                    const Color(0xFF0988B5).withOpacity(0.19),
                                borderRadius: BorderRadius.circular(9),
                                border: Border.all(color: Colors.black),
                                image: DecorationImage(
                                    image: AssetImage("assets/image/ayam.png"),
                                    fit: BoxFit.cover)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Daging Ayam",
                                  style: TextStyle(
                                    // color: Colors.white,
                                    fontFamily: 'poppins',
                                    fontSize: 19,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 1.2
                                      ..color = const Color.fromARGB(
                                          221, 255, 255, 255),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            width: 150,
                            height: 100,
                            decoration: BoxDecoration(
                                // boxShadow: [
                                //   // BoxShadow(
                                //   //   // color: Color(0xFF0988B5), // Warna bayangan
                                //   //   spreadRadius: 5, // Radius penyebaran bayangan
                                //   //   blurRadius: 7, // Radius blur bayangan
                                //   //   offset: Offset(0, 3), // Offset bayangan (dx, dy)
                                //   // ),
                                // ],
                                color:
                                    const Color(0xFF0988B5).withOpacity(0.19),
                                borderRadius: BorderRadius.circular(9),
                                border: Border.all(color: Colors.black),
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/image/kambing.png"),
                                    fit: BoxFit.cover)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Daging Kambing",
                                  style: TextStyle(
                                    // color: Colors.white,
                                    fontFamily: 'poppins',
                                    fontSize: 20,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 1.2
                                      ..color = const Color.fromARGB(
                                          221, 255, 255, 255),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            width: 150,
                            height: 100,
                            decoration: BoxDecoration(
                                // boxShadow: [
                                //   // BoxShadow(
                                //   //   // color: Color(0xFF0988B5), // Warna bayangan
                                //   //   spreadRadius: 5, // Radius penyebaran bayangan
                                //   //   blurRadius: 7, // Radius blur bayangan
                                //   //   offset: Offset(0, 3), // Offset bayangan (dx, dy)
                                //   // ),
                                // ],
                                color:
                                    const Color(0xFF0988B5).withOpacity(0.19),
                                borderRadius: BorderRadius.circular(9),
                                border: Border.all(color: Colors.black),
                                image: DecorationImage(
                                    image: AssetImage("assets/image/sapi.png"),
                                    fit: BoxFit.cover)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Daging Sapi",
                                  style: TextStyle(
                                    // color: Colors.white,
                                    fontFamily: 'poppins',
                                    fontSize: 20,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 1.2
                                      ..color = const Color.fromARGB(
                                          221, 255, 255, 255),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
