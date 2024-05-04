import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_projek/dto/cs.dart';
import 'package:my_projek/endpoints/cs_endpoint.dart';

class EditDatas extends StatefulWidget {
  final CustomerService customerService; // Define CustomerService object
  const EditDatas(this.customerService, {Key? key}) : super(key: key);

  @override
  _EditDatasState createState() => _EditDatasState();
}

class _EditDatasState extends State<EditDatas> {
  final _titleController = TextEditingController();
  final _ratingController = TextEditingController();
  final _descriptionController = TextEditingController();

  String _selectedDivision = 'Dailing'; // Default division
  double _priority = 0; // Default priority

  File? galleryFile;
  final picker = ImagePicker();

  void _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    super.initState();
    // Set initial values from CustomerService object
    _titleController.text = widget.customerService.titleIssues;
    _ratingController.text = widget.customerService.rating.toString();
    _descriptionController.text = widget.customerService.descriptionIssues;

    // Check if imageUrl is available, if not, set galleryFile to null
    if (widget.customerService.imageUrl != null) {
      setState(() {
        galleryFile = null; // Set galleryFile to null if imageUrl is available
      });
    } else {
      setState(() {
        galleryFile = null;
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _ratingController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  _showPicker({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
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
            ),
          ),
        );
      },
    );
  }

  Future getImage(ImageSource img) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(() {
      if (xfilePick != null) {
        galleryFile = File(pickedFile!.path);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nothing is selected')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(127, 204, 169, 141),
      appBar: AppBar(
        title: null,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        // Wrap the body in SingleChildScrollView
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Edit Issue",
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Edit data yang telah dimasukkan",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(225, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            DropdownButtonFormField<String>(
                              value: _selectedDivision,
                              decoration: InputDecoration(
                                labelText: 'Division',
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedDivision = newValue!;
                                });
                              },
                              items: <String>[
                                'Dailing',
                                'Teknis',
                                'Support'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            GestureDetector(
                              onTap: () {
                                _showPicker(context: context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                ),
                                width: double.infinity,
                                height: 150,
                                child: galleryFile == null
                                    ? widget.customerService.imageUrl != null
                                        ? Image.network(
                                            Uri.parse(
                                              '${Endpoints.baseURL}/public/${widget.customerService.imageUrl!}',
                                            ).toString(),
                                            width: 100,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    const Icon(Icons.error),
                                          )
                                        : Center(
                                            child: Text(
                                              'Pick your Image here',
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                color: const Color.fromARGB(
                                                    255, 124, 122, 122),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                    : Image.file(galleryFile!),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: _titleController,
                                decoration: const InputDecoration(
                                  hintText: "Title",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: _ratingController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: "Rating",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: _descriptionController,
                                decoration: const InputDecoration(
                                  hintText: "Description",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Slider(
                              value: _priority,
                              onChanged: (newValue) {
                                setState(() {
                                  _priority = newValue;
                                });
                              },
                              min: 0,
                              max: 10,
                              divisions: 10,
                              label: _priority.toString(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
        tooltip: 'Save',
        onPressed: () {
          _editDatas(context, widget.customerService.idCustomerService);
        },
        child: const Icon(Icons.save, color: Colors.white, size: 28),
      ),
    );
  }

  Future<void> _editDatas(BuildContext context, int idCustomerService) async {
    // Added ID parameter
    final String title = _titleController.text;
    final String description = _descriptionController.text;
    final int rating = int.tryParse(_ratingController.text) ?? 0;

    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please provide a title'),
        ),
      );
      return; // Stop execution if title is missing
    }

    var request = MultipartRequest(
      'POST',
      Uri.parse('${Endpoints.newcs}/$idCustomerService'),
    );

    request.fields['title_issues'] = title;
    request.fields['description_issues'] = description;
    request.fields['rating'] = rating.toString();

    if (galleryFile != null) {
      var multipartFile = await MultipartFile.fromPath(
        'image',
        galleryFile!.path,
      );
      request.files.add(multipartFile);
    }

    request.send().then((response) {
      // Handle response (success or error)
      if (response.statusCode == 200) {
        debugPrint('Data edited successfully!');
        Navigator.pop(context);
        Navigator.pushNamed(context, '/customer-screen');
        _showSnackBar('Data berhasil diperbarui'); // Tampilkan SnackBar
      } else {
        debugPrint('Error editing data: ${response.statusCode}');
      }
    }).catchError((error) {
      debugPrint('Error editing data: $error');
    });
  }
}
