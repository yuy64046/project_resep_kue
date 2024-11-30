import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final String? gambar, nama, deskripsi, harga;
  final List<dynamic>? bahan, caramembuat;

  const Detail({
    Key? key,
    this.gambar,
    this.nama,
    this.deskripsi,
    this.harga,
    this.bahan,
    this.caramembuat,
  }) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nama ?? 'Detail Item'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            Center(
              child: widget.gambar != null && widget.gambar!.isNotEmpty
                  ? Image.network(
                      widget.gambar!,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.image, size: 100, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            // Nama
            Text(
              widget.nama ?? 'Nama Tidak Tersedia',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Deskripsi
            Text(
              widget.deskripsi ?? 'Deskripsi Tidak Tersedia',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 16),
            // Harga
            Text(
              'Harga: ${widget.harga ?? 'Harga Tidak Tersedia'}',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(height: 16),
            // Bahan
            Text(
              'Bahan:',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (widget.bahan != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.bahan!.map((bahan) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text('- $bahan'),
                  );
                }).toList(),
              )
            else
              const Text('Bahan Tidak Tersedia'),
            const SizedBox(height: 16),
            // Cara Membuat
            Text(
              'Cara Membuat:',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (widget.caramembuat != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.caramembuat!.map((step) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text('- $step'),
                  );
                }).toList(),
              )
            else
              const Text('Cara Membuat Tidak Tersedia'),
          ],
        ),
      ),
    );
  }
}
