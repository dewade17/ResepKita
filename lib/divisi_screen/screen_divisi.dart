import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class ScreenDivisi extends StatefulWidget {
  const ScreenDivisi({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ScreenDivisiState createState() => _ScreenDivisiState();
}

class _ScreenDivisiState extends State<ScreenDivisi> {
  // @override
  // void initState() {
  //   super.initState();
  //   _rating = 0.0; // Nilai default rating
  // }

  File? galleryFile;
  final picker = ImagePicker();

  _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(
      () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }

  // var multipartFile = await MultipartFile.fromPath(
  //     'image',
  //     galleryFile!.path,
  //   );
  //   request.files.add(multipartFile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Additional Info"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Divisi",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Issue",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            GestureDetector(
              onTap: () {
                _showPicker(context: context);
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200))),
                width: double.infinity, // Fill available space
                height: 150, // Adjust height as needed
                // color: Colors.grey[200], // Placeholder color
                child: galleryFile == null
                    ? Center(
                        child: Text('Pick your Image here',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color.fromARGB(255, 124, 122, 122),
                              fontWeight: FontWeight.w500,
                            )))
                    : Center(
                        child: Image.file(galleryFile!),
                      ), // Placeholder text
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(10.0),
            //   child: Row(
            //     children: [
            //       Text(
            //         "Rating: ",
            //         style: TextStyle(
            //           fontSize: 16,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       SizedBox(width: 10), // Spacer
            //       Row(
            //         children: List.generate(
            //           5,
            //           (index) => IconButton(
            //             icon: Icon(
            //               index < _rating.floor()
            //                   ? Icons.star
            //                   : Icons.star_border,
            //               color: Colors.orange,
            //             ),
            //             onPressed: () {
            //               setState(() {
            //                 _rating = index + 1.0;
            //               });
            //             },
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
