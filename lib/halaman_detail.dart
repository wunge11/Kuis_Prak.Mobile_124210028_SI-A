import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'disease_data.dart';

class HalamanDetail extends StatefulWidget {
  final Diseases diseases;
  const HalamanDetail({Key? key, required this.diseases});

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              String text = "";
              setState(() {
                text = 'Masuk ke Daftar Favorit!';
                isFavorite = true;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(text),
                ),
              );
            },
            icon: Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.home_filled),
          ),

        ],
        title: Text(
          "Halaman Detail",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Image.network(
              widget.diseases.imgUrls,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
             widget.diseases.name,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "ID: ${widget.diseases.id}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Ciri: ${widget.diseases.nutshell[0]}",
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 18,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Nama: ${widget.diseases.plantName}",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Deskripsi:"
                  " ${widget.diseases.symptom}",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
        ),
            SizedBox(height: 20),
            FloatingActionButton(

              onPressed: () {
                _launchUrl(widget.diseases.imgUrls.toString());
              },
              child: Icon(Icons.search_outlined),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(height: 20),
          ],
        ),

      ),
    );

  }
}

Future<void> _launchUrl(String url) async {
  final Uri _url = Uri.parse(url);
  if (!await canLaunch(_url.toString())) {
    throw Exception('Gagal Membuka link : $_url.toString()');
  }
  await launch(_url.toString());
}

