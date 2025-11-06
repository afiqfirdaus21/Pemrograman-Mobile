import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final List<String> mataKuliah = const [
    'Manajemen Rantai Pasok',
    'Manajemen Proyek Sistem Informasi',
    'Perencanaan Sumber Daya',
    'Penjaminan Mutu Perangkat Lunak',
    'Keselamatan dan Kesehatan Kerja',
    'Audit Sistem Informasi',
    'Pemrograman Mobile',
    'Kecerdasan Bisnis',
    'Metodologi Penelitian',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage('assets/images/fotoprofile.jpg'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Nama: Muhammad Afiq Firdaus',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Text('NIM: 2341760189'),
                        Text('Prodi: Sistem Informasi Bisnis'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: mataKuliah.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.book, color: Colors.teal),
                    title: Text(mataKuliah[index]),
                  );
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/gallery');
                  },
                  icon: const Icon(Icons.photo_library),
                  label: const Text('Lihat Galeri'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: const Text('Kembali ke Home'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
