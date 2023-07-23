import 'package:flutter/material.dart';

void main() => runApp(DgsPuanHesaplayici());

class DgsPuanHesaplayici extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DgsPuanHesaplaPage(),
    );
  }
}

class DgsPuanHesaplaPage extends StatefulWidget {
  @override
  _DgsPuanHesaplaPageState createState() => _DgsPuanHesaplaPageState();
}

class _DgsPuanHesaplaPageState extends State<DgsPuanHesaplaPage> {
  double onLisansPuan = 40; // Başlangıç değeri 40
  int sayisalDogru = 0;
  int sayisalYanlis = 0;
  int sozelDogru = 0;
  int sozelYanlis = 0;

  void _hesaplaVeGoster() {
    double sayisalNet = sayisalDogru - (sayisalYanlis * 0.25);
    double sozelNet = sozelDogru - (sozelYanlis * 0.25);

    double dgsSozel = (sozelNet * 3.091) + (sayisalNet * 0.584) + (127.703) + (onLisansPuan * 0.6);
    double dgsSayisal = (sozelNet * 0.618) + (sayisalNet * 2.905) + (127.703) + (onLisansPuan * 0.6);
    double dgsEsitAgirlik = (sozelNet * 1.855) + (sayisalNet * 1.747) + (136.564) + (onLisansPuan * 0.6);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("DGS Puan Sonuçları"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("DGS Sözel Puanı: ${dgsSozel.toStringAsFixed(2)}"),
              Text("DGS Sayısal Puanı: ${dgsSayisal.toStringAsFixed(2)}"),
              Text("DGS Eşit Ağırlık Puanı: ${dgsEsitAgirlik.toStringAsFixed(2)}"),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Kapat"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DGS Puan Hesaplayıcı with Mert Mustafa Şen"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    onLisansPuan = double.tryParse(value) ?? 40;
                  });
                },
                decoration: InputDecoration(labelText: "Ön Lisans Başarı Puanı (40-80 arası)"),
              ),
              SizedBox(height: 16),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    sayisalDogru = int.tryParse(value) ?? 0;
                  });
                },
                decoration: InputDecoration(labelText: "Sayısal Doğru Sayısı (0-50 arası)"),
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    sayisalYanlis = int.tryParse(value) ?? 0;
                  });
                },
                decoration: InputDecoration(labelText: "Sayısal Yanlış Sayısı (0-50 arası)"),
              ),
              SizedBox(height: 16),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    sozelDogru = int.tryParse(value) ?? 0;
                  });
                },
                decoration: InputDecoration(labelText: "Sözel Doğru Sayısı (0-50 arası)"),
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    sozelYanlis = int.tryParse(value) ?? 0;
                  });
                },
                decoration: InputDecoration(labelText: "Sözel Yanlış Sayısı (0-50 arası)"),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _hesaplaVeGoster,
                child: Text("Puanı Hesapla"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
