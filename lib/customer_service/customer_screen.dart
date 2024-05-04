import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_projek/customer_service/edit_screen.dart';
import 'package:my_projek/customer_service/new_customer.dart';
import 'package:my_projek/dto/cs.dart';
import 'package:my_projek/endpoints/cs_endpoint.dart';
import 'package:my_projek/services/cs_service.dart';

// ignore_for_file: prefer_const_constructors, use_super_parameters, library_private_types_in_public_api, use_build_context_synchronously

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  Future<List<CustomerService>>? newcs;

  void _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    super.initState();
    newcs = DataService.fetchCustomerService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Service"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 54, 40, 176),
        tooltip: 'Add New Customer Service',
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FormScreen()));
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<CustomerService>>(
              future: newcs,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data!;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final item = data[index];
                      return ListTile(
                        title: item.imageUrl != null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                    Uri.parse(
                                            '${Endpoints.baseURL}/public/${item.imageUrl!}')
                                        .toString(),
                                    width: 100,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.error),
                                  ),
                                ],
                              )
                            : null,
                        subtitle: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Title : ${item.titleIssues}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: const Color.fromARGB(
                                            255, 36, 31, 31),
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Text(
                                      'Deskripsi : ${item.descriptionIssues}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: const Color.fromARGB(
                                            255, 36, 31, 31),
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Rating : ${item.rating}',
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 36, 31, 31),
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EditDatas(item),
                                          ),
                                        );
                                      },
                                      icon: Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        DataService.deleteDatas(
                                                item.idCustomerService)
                                            .then((_) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Data successfully deleted'),
                                            ),
                                          );
                                        }).catchError((error) {
                                          print('Error deleting data: $error');
                                        });
                                        Navigator.pop(context);
                                        Navigator.pushNamed(
                                            context, '/customer-screen');
                                        _showSnackBar('Data berhasil dihapus');
                                      },
                                      icon: Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(),
                          ],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('${snapshot.error}'));
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
