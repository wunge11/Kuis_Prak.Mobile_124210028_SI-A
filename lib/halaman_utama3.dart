import 'package:flutter/material.dart';

class GridCardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid Card Example'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Jumlah kolom dalam grid
          mainAxisSpacing: 16.0, // Spasi vertikal antara item
          crossAxisSpacing: 16.0, // Spasi horizontal antara item
        ),
        itemCount: 6, // Jumlah item dalam grid
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                // Aksi saat card ditekan
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'https://via.placeholder.com/150', // Ganti dengan URL gambar sesuai kebutuhan
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Item $index', // Ganti dengan data yang sesuai
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: GridCardExample()));
}
