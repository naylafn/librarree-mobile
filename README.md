### Nayla Farah Nida - 2306213426 

<details>
  <summary>Tugas 7: Elemen Dasar Flutter</summary>

### _Stateless Widget_ vs _Stateful Widget_

State adalah informasi yang dapat dibaca secara sinkronus saat widget sedang di build dan dapat berubah-ubah selama aplikasi berjalan. State sangat penting karena mempengaruhi tampilan dan interaksi widget di aplikasi.

**Stateless widget**
widget dengan state yang tidak bisa berubah setelah dibuat, kecuali aplikasi dijalankan ulang. Stateless widget meng-override method build() dan me-return sebuah widget. Contohnya widget statis seperti icon dan text.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Hello Flutter')),
        body: Center(child: Text('Welcome to Flutter!')),
      ),
    );
  }
}
```

**Stateful Widget**
Widget dengan state yang dapat berubah-ubah. Jika terdapat perubahan pada state, widget akan di re-build untuk menampilkan pembaruannya. Contohnya tombol yang meng-increment angka counter atau mengubah warna saat ditekan. Stateful widget memiliki kelas yang berpasangan dengan kelas State-nya sendiri.

```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('Counter: $counter');
  }
}
```

| Stateless Widget  | Stateful Widget |
| ------------- | ------------- |
| State tidak bisa berubah  | State bisa berubah-ubah  |
| Untuk elemen statis yang tidak berubah setelah dirender | Untuk elemen dinamis yang berubah seiring waktu dan interaksi |
| Tidak di re-build setelah ditampilkan | Di re-build setiap kali state berubah |

### Widget yang Digunakan

  ```MaterialApp```: Pembungkus utama aplikasi flutter untuk tema dan pengaturan seluruh aplikasi.
  ```Scaffold```: Struktur dasar halaman (AppBar, Body, dll) untuk membuat tampilan yang konsisten.
  ```AppBar```: Membuat potongan aplikasi di bagian atas halaman yang dapat menampilkan judul, icon, dan aksi lainnya.
  ```Padding```: Menambah jarak di sekitar widget.
  ```Column```: Menyusun widget secara vertikal.
  ```Row```: Menyusun widget secara horizontal.
  ```InfoCard```: Widget custom untuk menampilkan kartu berisi informasi _title_ dan _content_. 
  ```Card```: Membuat kartu.
  ```ItemCard```: Widget custom untuk menampilkan tombol dalam bentuk kartu berisi icon dan text.

### setState()

Fungsi ```setState()``` mengindikasikan bahwa ada perubahan pada data atau tampilan yang perlu diperbarui sehingga memicu flutter untuk rebuild dengan memanggil kembali method ```build()```.

Variabel yang terpengaruh oleh fungsi ```setState()``` adalah variabel yang termasuk dalam kelas _stateful widget_.

### Const vs Final

| Const | Final |
| ------------- | ------------- |
| Nilai konstan secara kompilasi | Nilainya dapat ditentukan saat runtime |
| **Immutable** tidak dapat diubah setelah didefinisikan | **Immutable** tidak dapat diubah setelah didefinisikan |
| **Instansiasi sekali**, objek const yang sama akan mengacu ke instance yang sama sehingga menghemat memori | **Fleksibel di runtime**, memungkinkan nilai yang baru diketahui saat runtime |
| Untuk nilai yang diketahui dan tetap saat compile time | Untuk nilai yang tetap setelah diinisialisasi, namun baru akan tersedia saat runtime |

### Implementasi Tugas

- Membuat proyek flutter baru . (```flutter create librarree```)
- Membuat stateless widget ```MyHomePage```, sebagai tampilan utama home page yang berisi scaffold (title), dan body (card nama, card npm, card class, dan tombol-tombol)
- Membuat stateless widget ```InfoCard(title, content)```, card yang terdiri dari title dan content.
- Membuat objek ```ItemHomePage(name, icon, color)```, objek untuk membuat item yang ingin ditampilkan.
- Membuat stateless widget ```ItemCard``` untuk menampilkan kartu yang berisi objek ```ItemHomePage```.

</details>
