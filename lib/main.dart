import 'package:chat_uygulamasi/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Pacifico'),
      debugShowCheckedModeBanner: false,
      title: 'Chat Uygulamasi',
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat Uygulamasi',
          style: GoogleFonts.acme(),
        ),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  List<MessajBalonu> mesajListesi = [];
  listeyeEkle(String gelenMesaj) {
    setState(() {
      MessajBalonu mesajNesnesi = MessajBalonu(
        mesaj: gelenMesaj,
      );
      mesajListesi.insert(0, mesajNesnesi);
      t1.clear();
    });
  }

  Widget metinGirisAlani() {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: t1,
            ),
          ),
          IconButton(
              onPressed: () => listeyeEkle(t1.text),
              icon: const Icon(Icons.send))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: mesajListesi.length,
              itemBuilder: (context, indexNumarasi) =>
                  mesajListesi[indexNumarasi],
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          metinGirisAlani(),
        ],
      ),
    );
  }
}

String isim = 'Kulannici1';

class MessajBalonu extends StatelessWidget {
  var mesaj;
   MessajBalonu({this.mesaj});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          CircleAvatar(
            child: Text(isim[0]),
          ),
          Column(
            children: [
              Text(isim),
              Text(mesaj),
            ],
          )
        ],
      ),
    );
  }
}
