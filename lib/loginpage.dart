import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = true; // Perbaiki penamaan variabel

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: SingleChildScrollView( // Tambahkan SingleChildScrollView agar tampilan dapat digulir jika keyboard muncul
          child: Column(
            children: [
              Image.asset('assets/login.png'),
              SizedBox(height: 10),
              Text(
                'Login',
                style: TextStyle(
                  //color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 31,
                  letterSpacing: 4.0,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Silakan login terlebih dahulu!',
                style: TextStyle(
                  //color: Colors.black87,
                  fontSize: 15,
                  letterSpacing: 1.0,
                ),
              ),
              _usernameField(),
              _passwordField(),
              _login(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Masukkan Username',
          labelText: 'Username',
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: (isLoginSuccess) ? Colors.blue : Colors.red,
            ),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          password = value;
        },
        obscureText: true,
        obscuringCharacter: '\*',
        decoration: InputDecoration(
          hintText: 'Masukkan Password',
          labelText: 'Password',
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: (isLoginSuccess) ? Colors.blue : Colors.red,
            ),
          ),
        ),
      ),
    );
  }

  Widget _login(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          String text = "";
          if (username == "mahasiswa" && password == "123") {
            setState(() {
              text = 'Login Berhasil';
              isLoginSuccess = true;
            });
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => HalamanUtama2()), // Ganti dengan halaman yang sesuai
            // );
          } else {
            setState(() {
              text = 'Login Gagal';
              isLoginSuccess = false;
            });
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(text),
            ),
          );
        },
        child: const Text('Login'),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(40, 50),
          backgroundColor: (isLoginSuccess) ? Colors.blue : Colors.red,
          onPrimary: Colors.white,
        ),
      ),
    );
  }
}
