import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api.dart'; // Pastikan BaseUrl sudah benar
import 'detail.dart'; // Pastikan Detail sudah disesuaikan dengan parameter yang benar

class ResepKue extends StatefulWidget {
  const ResepKue({Key? key}) : super(key: key);

  @override
  State<ResepKue> createState() => _ResepKueState();
}

class _ResepKueState extends State<ResepKue> {
  Future<List<dynamic>> _fetchData() async {
    try {
      var response = await http.get(Uri.parse(BaseUrl.resepkue));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Kue")),
      body: FutureBuilder<List<dynamic>>(
        future: _fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("Data tidak ditemukan."),
            );
          }

          // Jika data tersedia
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final item = snapshot.data![index];
              return RecipeTile(
                item: item,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detail(
                        gambar: item['gambar'],
                        nama: item['nama'],
                        deskripsi: item['deskripsi'],
                        harga: item['harga'],
                        bahan: item['bahan'],
                        caramembuat: item['cara_membuat'],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class RecipeTile extends StatelessWidget {
  final dynamic item;
  final VoidCallback onTap;

  const RecipeTile({required this.item, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Image.network(
          item['gambar'],
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(item['nama']),
        subtitle: Text("Harga: ${item['harga']}"),
      ),
    );
  }
}
