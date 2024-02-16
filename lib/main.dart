import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata App',
      home: BiodataForm(),
    );
  }
}

class BiodataForm extends StatefulWidget {
  @override
  _BiodataFormState createState() => _BiodataFormState();
}

class _BiodataFormState extends State<BiodataForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _majorController = TextEditingController();
  final TextEditingController _birthplaceController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            TextField(
              controller: _majorController,
              decoration: InputDecoration(labelText: 'Jurusan'),
            ),
            TextField(
              controller: _birthplaceController,
              decoration: InputDecoration(labelText: 'Tempat Lahir'),
            ),
            TextField(
              controller: _birthdateController,
              decoration: InputDecoration(labelText: 'Tanggal Lahir'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showBiodata();
              },
              child: Text('Tampilkan Biodata'),
            ),
          ],
        ),
      ),
    );
  }

  void _showBiodata() {
    String name = _nameController.text;
    String address = _addressController.text;
    String major = _majorController.text;
    String birthplace = _birthplaceController.text;
    String birthdate = _birthdateController.text;

    String biodata =
        'Nama: $name\nAlamat: $address\nJurusan: $major\nTempat Lahir: $birthplace\nTanggal Lahir: $birthdate';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Biodata'),
          content: Text(biodata),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}
