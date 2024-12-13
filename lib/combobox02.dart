import 'package:flutter/material.dart';

class Combobox02 extends StatefulWidget {
  const Combobox02({super.key});

  @override
  State<Combobox02> createState() => _Combobox02State();
}

class _Combobox02State extends State<Combobox02> {
  String? pilihKategori;
  String? pilihItem; // Variabel untuk menyimpan item terpilih

  final List<String> categories = ['Buah', 'Sayur']; // Daftar kategori

  final Map<String, List<String>> items = {
    'Buah': ['Apel', 'Pisang', 'Jeruk'],
    'Sayur': ['Wortel', 'Bayam', 'Kangkung'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Combobox Bersarang'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Dropdown untuk memilih kategori
            DropdownButton<String>(
              hint: const Text('Pilih Kategori'),
              value: pilihKategori,
              onChanged: (String? newValue) {
                setState(() {
                  pilihKategori = newValue;
                  pilihItem = null; // Reset pilihan item
                });
              },
              items: categories.map((String kategori) {
                return DropdownMenuItem<String>(
                  value: kategori,
                  child: Text(kategori),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Dropdown untuk memilih item berdasarkan kategori
            DropdownButton<String>(
              value: pilihItem,
              hint: const Text('Pilih Item'),
              onChanged: (String? newValue) {
                setState(() {
                  pilihItem = newValue;
                });
              },
              items: pilihKategori != null
                  ? items[pilihKategori!]!
                      .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList()
                  : [],
            ),
          ],
        ),
      ),
    );
  }
}
