import 'package:flutter/material.dart';

class Image02 extends StatelessWidget {
  const Image02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/1.jpg'),
            Image.asset('assets/2.jpg'),
            Image.asset('assets/3.jpg'),
            Image.asset('assets/4.jpg'),
            Image.asset('assets/5.jpg'),
            Image.asset('assets/6.jpg'),
          ],
        ),
      ),
    );
  }
}
