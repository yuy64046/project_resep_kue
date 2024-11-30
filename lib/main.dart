// Import yang wajib digunakan
import 'package:flutter/material.dart';
import 'resepkue.dart'; // File lokal yang berisi logika tampilan Resep Kue

// Fungsi utama yang pertama kali dijalankan oleh Flutter
void main() {
  // `runApp` menjalankan aplikasi Flutter dengan widget MyApp sebagai root widget
  runApp(const MyApp());
}

// Kelas utama aplikasi, yang merupakan widget stateless
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Halaman awal aplikasi akan menuju widget Resepkue
      home: ResepKue(),
    );
  }
}
