import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pertemuan8/themeprovider.dart';
import 'package:provider/provider.dart';
import 'name_page.dart'; // ← tambahkan ini

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String nama = "";

  @override
  void initState() {
    super.initState();
    _loadNama();
  }

  Future<void> _loadNama() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nama = prefs.getString('nama_pengguna') ?? "Belum diatur";
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<Themeprovider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan Tema'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tampilkan nama pengguna
            Text(
              "Nama Pengguna: $nama",
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => NamePage()));
              },
              child: Text("Edit Nama Pengguna"),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Mode Gelap'),
                Switch(
                  value: themeprovider.isDarkMode,
                  onChanged: (value) {
                    final provider = Provider.of<Themeprovider>(
                        context, listen: false);
                    provider.toggleTheme(value);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
