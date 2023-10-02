import 'package:flutter/material.dart';
import 'package:tes_modul4/halaman_detail.dart';
import 'disease_data.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.maps_home_work_rounded),
        title: Text(
          "Halaman Utama",
          style: TextStyle(
            fontSize: 20.0, // Ukuran teks untuk AppBar ini
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: listDisease.length,
        itemBuilder: (context, index) {
          final Diseases diseases = listDisease[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HalamanDetail(diseases: diseases);
                  },
                ),
              );
            },
            child: Card(
              elevation: 2, // Tinggi elevasi Card
              margin: EdgeInsets.all(10.0), // Margin luar Card
              color: Colors.white, // Warna latar belakang Card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ), // Bentuk Card
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ClipOval(
                      child: Container(
                        width: 150.0, // Lebar frame bulat
                        height: 150.0, // Tinggi frame bulat
                        color: Colors.blue, // Warna latar belakang frame bulat
                        child: Image.network(
                          diseases.imgUrls,
                          fit: BoxFit.cover,
                        ), // Path gambar yang ingin ditampilkan
                        // Atur bagaimana gambar ditampilkan dalam frame
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(diseases.name,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
