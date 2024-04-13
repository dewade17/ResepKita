import 'package:flutter/material.dart';
import 'package:my_projek/components/asset_image_widget.dart';

class NegaraScreen extends StatefulWidget {
  const NegaraScreen({Key? key}) : super(key: key);

  @override
  _NegaraScreenState createState() => _NegaraScreenState();
}

class _NegaraScreenState extends State<NegaraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Bahasa"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    AssetImageWidget(
                      imagePath: 'assets/image/inggris.png',
                      width: 110,
                      height: 110,
                    ),
                    Positioned(
                      bottom: -5,
                      child: Text(
                        'English',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Hero(
                      tag: 'flagImage', // Same tag as in the ProfileScreen
                      child: AssetImageWidget(
                        imagePath: 'assets/image/Indonesia.png',
                        width: 110,
                        height: 110,
                      ),
                    ),
                    Positioned(
                      bottom: -7,
                      child: Text(
                        'Indonesia',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    AssetImageWidget(
                      imagePath: 'assets/image/russia.png',
                      width: 120,
                      height: 120,
                    ),
                    Positioned(
                      bottom: -7,
                      child: Text(
                        'Russia',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    AssetImageWidget(
                      imagePath: 'assets/image/China.png',
                      width: 120,
                      height: 120,
                    ),
                    Positioned(
                      bottom: -7,
                      child: Text(
                        'China',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
