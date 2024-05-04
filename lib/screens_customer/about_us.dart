import 'package:flutter/material.dart';
import 'package:my_projek/components/asset_image_widget.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("About Us"),
        ),
        body: Column(
          children: [
            Center(
              child: AssetImageWidget(
                imagePath: "assets/image/logo.png",
                width: 100,
                height: 100,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Resep.kita merupakan sebuah platform yang mewadahi para komunitas yang gemar memmasak untuk berbagi resep makanan",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
                width: double.infinity,
                child: Column(
                  children: [],
                )),
          ],
        ));
  }
}
