import 'package:flutter/material.dart';

class Image04 extends StatelessWidget {
  const Image04({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar Dari Url'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildImageCard(
                'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg?auto=compress&cs=tinysrgb&w=600'),
            buildImageCard(
                'https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?auto=compress&cs=tinysrgb&w=600'),
            buildImageCard(
                'https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=600'),
            buildImageCard(
                'https://images.pexels.com/photos/33545/sunrise-phu-quoc-island-ocean.jpg?auto=compress&cs=tinysrgb&w=600'),
            buildImageCard(
                'https://images.pexels.com/photos/2101187/pexels-photo-2101187.jpeg?auto=compress&cs=tinysrgb&w=600'),
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
              height: 150.0,
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
