import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
    MyHomePage({super.key});

    final String npm = '2306213426';
    final String name = 'Nayla Farah Nida';
    final String className = 'PBP F';

     @override
     Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text(
                'Librarree',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    ),
                ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            ),

            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            InfoCard(title: 'NPM', content: npm),
                            InfoCard(title: 'Name', content: name),
                            InfoCard(title: 'Class', content: className),
                        ],
                    ),

                 const SizedBox(height: 16.0),

                 Center(
                   child: Column(

                     children: [
                       const Padding(
                         padding: EdgeInsets.only(top: 16.0),
                         child: Text(
                           'Welcome to Librarree',
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 18.0,
                           ),
                         ),
                       ),

                       GridView.count(
                         primary: true,
                         padding: const EdgeInsets.all(20),
                         crossAxisSpacing: 10,
                         mainAxisSpacing: 10,
                         crossAxisCount: 3,
                         // Agar grid menyesuaikan tinggi kontennya.
                         shrinkWrap: true,

                         children: items.map((ItemHomepage item) {
                           return ItemCard(item);
                         }).toList(),
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           ),
         );
       }

     final List<ItemHomepage> items = [
         ItemHomepage("Lihat Produk", Icons.mood, color: Colors.red),
         ItemHomepage("Tambah Produk", Icons.add, color: Colors.yellow),
         ItemHomepage("Logout", Icons.logout, color: Colors.green),
     ];
}

class InfoCard extends StatelessWidget {
  // Kartu informasi yang menampilkan title dan content.

  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Membuat kotak kartu dengan bayangan dibawahnya.
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5, // menyesuaikan dengan lebar device yang digunakan.
        padding: const EdgeInsets.all(16.0),
        // Menyusun title dan content secara vertikal.
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
     final String name;
     final IconData icon;
     final Color color;

     ItemHomepage(this.name, this.icon, {this.color = Colors.black});
 }

class ItemCard extends StatelessWidget {
  // Menampilkan kartu dengan ikon dan nama.

  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),

      child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
        },
        // Container untuk menyimpan Icon dan Text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Menyusun ikon dan teks di tengah kartu.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}