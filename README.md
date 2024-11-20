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

  ```InkWell```: Mendeteksi event pada ```ItemCard``` dan menampilkan pesan pada ```SnackBar```.
  
  ```SnackBar```: Menampilkan pesan sementara.

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

<details>
  <summary>Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements</summary>

### const di Flutter

**Kegunaan dan Keuntungan:**

Widget yang didefinisikan dengan ```const``` hanya dibuat sekali dalam memori sehingga dapat menghemat penggunaan memori. Oleh karena itu juga widget tidak dapat diubah setelah didefinisikan dengan ```const```. Penggunaan ```const``` juga meningkatkan performa karena widget tidak perlu dibuat ulang setiap kali aplikasi di-render.

**Kapan Digunakan:**

```const``` sebaiknya digunakan untuk membuat widget yang statis atau tidak bergantung pada data yang berubah-ubah, dan untuk mendefinisikan variabel yang sudah diketahui pada saat compile time.

Sebaliknya, jangan gunakan ```const``` untuk widget yang bergantung pada data dinamis (misalnya data dari input user).

### Row vs Column

**Row**

Digunakan untuk menempatkan elemen-elemen secara horizontal.

```dart
Row(
  {Key key,
  MainAxisAlignment mainAxisAlignment: MainAxisAlignment.start,
  MainAxisSize mainAxisSize: MainAxisSize.max,
  CrossAxisAlignment crossAxisAlignment: CrossAxisAlignment.center,
  TextDirection textDirection,
  VerticalDirection verticalDirection: VerticalDirection.down,
  TextBaseline textBaseline: TextBaseline.alphabetic,
  List<Widget> children: const <Widget>[]}
)
```

Contoh:

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    Icon(Icons.book),
    Text('Hello World'),
    ElevatedButton(
      onPressed: () {},
      child: Text('Click Me'),
    ),
  ],
)
```

**Column**

Digunakan untuk menempatkan elemen-elemen secara vertikal.

```dart
Column(
  {Key key,
  MainAxisAlignment mainAxisAlignment: MainAxisAlignment.start,
  MainAxisSize mainAxisSize: MainAxisSize.max,
  CrossAxisAlignment crossAxisAlignment: CrossAxisAlignment.center,
  TextDirection textDirection,
  VerticalDirection verticalDirection: VerticalDirection.down,
  TextBaseline textBaseline,
  List<Widget> children: const <Widget>[]}
)
```

contoh:

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Text('Item 1'),
    Text('Item 2'),
    ElevatedButton(
      onPressed: () {},
      child: Text('Button'),
    ),
  ],
)

```

| Properties | Row | Column |
| ------------- | ------------- | ------------- |
| MainAxisAlignment | Horizontal | Vertikal |
| CrossAxisAlginment | Vertikal | Horizontal |

### Elemen Input yang Digunakan

**Input: title, author** => TextFormField()

```dart
TextFormField(
  decoration: InputDecoration(
    labelText: "Input name",
    border: OutlineInputBorder(),
  ),
  onChanged: (value) {
    // Handle change
  },
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Book title can\'t be empty!';
    }
    return null;
  },
),
```

**Input: price** => TextFormField()

```keyboardType``` disesuaikan menjadi ```TextInputType.number``` agar input hanya berupa angka.

```dart
TextFormField(
  keyboardType: TextInputType.number,
  decoration: InputDecoration(
    labelText: "Price",
    border: OutlineInputBorder(),
  ),
  onChanged: (value) {
    // Handle change
  },
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Price can\'t be empty!';
    }
    if (int.tryParse(value) == null) {
      return 'Price must be a number!';
    }
    return null;
  },
),
```

**Elemen input lain:**

```TextField()```: Menerima input teks.

```Checkbox()```: Membuat opsi pilihan untuk user.

```Switch()```: Membuat opsi untuk user dalam bentuk switch.

```Radio()```: Memungkinkan user memilih lebih dari satu opsi.

```Slider()```: Memungkinkan user memilih nilai dalam rentang tertentu dengan menyeret thumb.

```DropdownButton()```: Menampilkan daftar pilihan yang dapat dipilih.

```Datepicker()```: Digunakan untuk memilih tanggal.

### Tema (theme) Flutter

Mengimplementasikan tema di flutter menggunakan properti ```theme``` pada widget ```MaterialApp``` di file ```main.dart```.

**Tema yang digunakan:**

```dart
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: const Color(0xFF00B4D8),
        ),
      ),
      home: MyHomePage(),
    );
  }
```

```ColorScheme```: Mengatur skema warna dengan properti ```primary``` dan ```secondary```.

### Cara Menangani Navigasi dalam Aplikasi

Menangani navigasi dengan ```Navigator.pushReplacement``` untuk menggantikan halaman yang sedang ditampilkan dengan halaman yang baru. Metode ini akan menghapus halaman yang sedang ditampilkan dari navigation stack dan menggantinya dengan halaman baru. 

```dart
ListTile(
  leading: const Icon(Icons.book),
  title: const Text('Add a New Book'),
  onTap: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BookFormPage(),
      )
    );
  }
),
```

Fungsi: Mengganti halaman saat ini dengan halaman baru dan menghapus halaman yang sedang aktif dari tumpukan.

</details>

<details>
  <summary>Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter</summary>

  ### Model untuk data delivery 

  Menggunakan ```model``` tidak diwajibkan dan tidak akan terjadi error jika kita tidak membuat ```model``` dahulu. Namun, penggunaan model memiliki banyak keuntungan.

  - **Menjaga konsistensi data**: Model menjaga struktur data supaya sesuai dengan harapan, seperti atribut dan tipe data yang benar.

  - **Validasi data**:  Model dapat digunakan untuk memvalidasi data sebelum diproses lebih lanjut.

  - **Pemrosesan data lebih mudah**: Model meningkatkan produktivitas dan mengurangi kesalahan dalam penanganan data.

  - **Dokumentasi yang lebih baik**: Model mempermudah pemeliharaan kode dan kolaborasi.

  Meskipun tidak akan terjadi error jika tidak menggunakan ```model```, kemungkinan terjadinya error akan lebih besar.

  ### Library ```http```

  Library ```http``` digunakan untuk melakukan HTTP request ke server serta mengelola response yang diterima dari server. Fungsi utama dari library ini meliputi pengiriman data ke server, pengambilan data dari server, dan menangani komunikasi HTTP secara umum.

  Contoh: melakukan HTTP request untuk mengambil data untuk login.
  ```dart
final response = await request
  .login("http://127.0.0.1:8000/auth/login/", {
    'username': username,
    'password': password,
});
  ```

### Mekanisme data delivery

1. User memasukkan input melalui form flutter, data tersebut kemudian disimpan sementara di variabel atau model data Dart.
2. Flutter mengirimkan data ke server melalui HTTP request menggunakan library ```http```.
3. Server menerima permintaan dan data JSON, kemudian django memproses data menggunakan views dan serializer untuk validasi dan penyimpanan ke database. Jika data valid, server menyimpan data dan mengembalikan respons JSON.
4. Flutter menerima respons JSON dari server, lalu memproses data tersebut dengan mem-parse JSON ke objek Dart menggunakan model data.
5. Flutter memperbarui tampilan UI (misalnya, menggunakan setState, Provider, atau Riverpod) agar data terbaru ditampilkan kepada pengguna.

### Mekanisme autentikasi

**Register**

1. User memasukkan data registrasi (username dan password) melalui form di aplikasi Flutter.
2. Flutter mengirim permintaan HTTP POST ke endpoint API registrasi di Django, data yang dikirim berupa JSON yang berisi informasi pengguna.
```dart
final response = await request.postJson(
  "http://127.0.0:8000/auth/register/",
  jsonEncode({
    "username": username,
    "password1": password1,
    "password2": password2,
}));
```
3. Django menerima data melalui endpoint yang telah diatur di ```authentication/views.py```. Jika valid, Django membuat akun pengguna baru dan menyimpan data ke database.

**Login**

1. User memasukkan data login (username dan password) melalui form di aplikasi flutter.
2. Flutter mengirim permintaan HTTP POST ke endpoint API login di Django. Jika menggunakan token, Django akan mengembalikan token autentikasi.
```dart
final response = await request
  .login("http://127.0.0.1:8000/auth/login/", {
    'username': username,
    'password': password,
});
```
3. Django memvalidasi kredensial pengguna. Jika valid, Django mengembalikan token autentikasi.
4. Flutter menyimpan token autentikasi yang diterima. Token ini digunakan untuk permintaan API selanjutnya agar pengguna tetap terautentikasi.
5. Setelah login berhasil, Flutter mengarahkan pengguna ke halaman utama.

**Logout**

1. User menekan tombol logout.
2. Flutter mengirimkan permintaan logout ke endpoint API.
```dart
final response = await request.logout("http://127.0.0:8000/auth/logout/");
```
3. Jika diperlukan, server dapat menghapus atau menandai token sebagai tidak valid.
4. Hapus token autentikasi dari penyimpanan lokal.

### Implementasi tugas

- Membuat model Dart dari model JSON di Django melalui website quicktype.
- Menghubungkan Flutter dengan Django dengan mengimplementasikan kode di Flutter untuk mengirim permintaan HTTP ke endpoint Django (GET, POST, dll.).
- Parse respons JSON yang diterima ke objek Dart, kemudian menampilkan data di UI Flutter.
- Mengimplementasikan fungsi register, login dan logout dengan pengiriman data ke endpoint autentikasi Django.
- Mengambil objek model ```Book``` dari database untuk ditampilkan di aplikasi flutter.

</details>
