import 'package:flutter/material.dart';

class Studikasus03 extends StatefulWidget {
  const Studikasus03({super.key});

  @override
  State<Studikasus03> createState() => _Studikasus03State();
}

class _Studikasus03State extends State<Studikasus03> {
  String? _selectedHokage;
  String _imageUrl =
      'https://vignette.wikia.nocookie.net/naruto/images/2/27/Hashirama_Senju.png/revision/latest?cb=20151122204310'; // Default image

  final List<String> hokages = [
    'Hokage 1',
    'Hokage 2',
    'Hokage 3',
    'Hokage 4',
    'Hokage 5',
  ];

  final Map<String, String> hokageImages = {
    'Hokage 1':
        'https://vignette.wikia.nocookie.net/naruto/images/2/27/Hashirama_Senju.png/revision/latest?cb=20151122204310', // Hashirama Senju
    'Hokage 2':
        'https://vignette.wikia.nocookie.net/naruto/images/6/64/Tobirama_Senju.png/revision/latest?cb=20151031223028', // Tobirama Senju
    'Hokage 3':
        'https://vignette.wikia.nocookie.net/naruto/images/0/08/Hiruzen_Sarutobi.png/revision/latest?cb=20151031190553', // Hiruzen Sarutobi
    'Hokage 4':
        'https://vignette.wikia.nocookie.net/naruto/images/3/36/Minato_Namikaze.png/revision/latest?cb=20151031191355', // Minato Namikaze
    'Hokage 5':
        'https://vignette.wikia.nocookie.net/naruto/images/9/95/Tsunade_Senju.png/revision/latest?cb=20151031203946', // Tsunade Senju
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Studikasus03 - Hokage Image'),
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Dropdown Menu for Hokage Selection
            DropdownButton<String>(
              hint: const Text('Pilih Hokage'),
              value: _selectedHokage,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedHokage = newValue;
                });
              },
              items: hokages.map<DropdownMenuItem<String>>((String hokage) {
                return DropdownMenuItem<String>(
                  value: hokage,
                  child: Text(hokage),
                );
              }).toList(),
            ),

            // ElevatedButton to load the image based on selected Hokage
            ElevatedButton(
              onPressed: () {
                if (_selectedHokage != null) {
                  setState(() {
                    _imageUrl = hokageImages[_selectedHokage]!;
                  });
                }
              },
              child: const Text('Tampilkan Gambar Hokage'),
            ),

            // Display the image based on the selected Hokage
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildImageCard(_imageUrl),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImageCard(String imageUrl) {
    return Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(imageUrl,
              fit: BoxFit.cover,
              height: 250.0,
              width: double.infinity, loadingBuilder: (BuildContext context,
                  Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null),
            );
          }, errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
            return Center(child: const Text('Gagal Memuat Gambar'));
          }),
        ));
  }
}
