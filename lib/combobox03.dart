import 'package:flutter/material.dart';

class Combobox03 extends StatefulWidget {
  const Combobox03({super.key});

  @override
  State<Combobox03> createState() => _Combobox03State();
}

class _Combobox03State extends State<Combobox03> {
  String? selectedItem; // Variable untuk menyimpan item yg dipilih

  final List<Map<String, dynamic>> items = [
    {'value': 'Rumah', 'icon': Icons.home},
    {'value': 'Bintang', 'icon': Icons.star},
    {'value': 'Pengaturan', 'icon': Icons.settings},
    {'value': 'Pengguna', 'icon': Icons.person},
  ]; // daftar item dengan ikon

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Combobox dan Icon'),
      ),
      body: Center(
        child: DropdownButton<String>(
          hint: const Text('Pilih item'),
          value: selectedItem,
          onChanged: (String? newValue) {
            setState(() {
              selectedItem = newValue;
            });
          },
          items:
              items.map<DropdownMenuItem<String>>((Map<String, dynamic> item) {
            return DropdownMenuItem<String>(
              value: item['value'],
              child: Row(
                children: [
                  Icon(item['icon']),
                  const SizedBox(width: 8),
                  Text(item['value']),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
