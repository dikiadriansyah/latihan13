import 'package:flutter/material.dart';

void main() {
  runApp(const AppKu());
}

class AppKu extends StatelessWidget{
  const AppKu({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Latihan 13',
      theme: ThemeData(
        // -----------------
        // dapat mengubah font family pada satu per satu widget Text, kita dapat membuat font yang kita daftarkan menjadi default. Caranya dengan menambahkan parameter fontFamily pada kelas ThemeData yang ada pada parameter theme di MaterialApp
          fontFamily: 'Oswald',
          // -----------------
          primarySwatch: Colors.blue
      ),
      home: const ScrollingScreen(),
    );
  }
}


class ScrollingScreen extends StatelessWidget {
  const ScrollingScreen({Key? key}): super(key: key);

  // ---------
  //  Menampilkan Item secara dinamis
  final List<int> numberList = const <int>[1,2,3,4,5,6,7,8,9,10];
  // ---------

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body:
        // ListView(
            // ListView adalah widget untuk menampilkan beberapa item dalam bentuk baris atau kolom dan bisa di-scroll.

            // children: <Widget>[
            //   //  ListView ini mirip dengan Column atau Row di mana Anda memasukkan widget yang ingin disusun sebagai children dari ListView.
            //
            //   Container(
            //     height: 250,
            //     decoration: BoxDecoration(
            //         color: Colors.grey,
            //         border: Border.all(color: Colors.black)
            //     ),
            //     child: const Center(
            //       child: Text('1', style: TextStyle(fontSize: 50)),
            //     ),
            //   ),
            //   Container(
            //     height: 250,
            //     decoration: BoxDecoration(
            //       color: Colors.grey,
            //       border: Border.all(color: Colors.black)),
            //     child: const Center(
            //       child: Text('2', style: TextStyle(fontSize: 50)),
            //     ),
            //   ),
            //   Container(
            //     height: 250,
            //     decoration: BoxDecoration(
            //         color: Colors.grey,
            //         border: Border.all(color: Colors.black)),
            //     child: const Center(
            //       child: Text('3', style: TextStyle(fontSize: 50)),
            //     ),
            //   ),
            //   Container(
            //     height: 250,
            //     decoration: BoxDecoration(
            //         color: Colors.grey,
            //         border: Border.all(color: Colors.black)
            //     ),
            //     child: const Center(
            //       child: Text('4', style: TextStyle(fontSize: 50)),
            //     ),
            //   )
            // ]

          // -----------
          //    masukkan variabel atau list Anda sebagai children lalu panggil fungsi map(). Fungsi map ini berguna untuk memetakan atau mengubah setiap item di dalam list menjadi objek yang kita inginkan. Fungsi map ini membutuhkan satu buah parameter berupa fungsi atau lambda.
          // children: numberList.map((number){
          //   // Karena parameter children ini membutuhkan nilai berupa list widget, maka kita perlu mengembalikan setiap item dari numberList menjadi widget yang akan ditampilkan.
          //
          //   return Container(
          //     height: 250,
          //     decoration: BoxDecoration(
          //       color: Colors.grey,
          //       border: Border.all(color: Colors.black)),
          //     child: Center(
          //       child: Text(
          //         '$number', // ditampilkan sesuai item
          //         style: const TextStyle(fontSize: 50)
          //       ),
          //     ),
          //   );
          // }).toList(),
          /*
          Perhatikan di akhir kita perlu mengembalikan fungsi map menjadi objek List lagi dengan fungsi .toList().
           */

        // )

      //   ---------------------------------------
      //   Menggunakan ListView.builder
        /*
        ListView.builder lebih cocok digunakan pada ListView dengan jumlah item yang cukup besar. Ini karena Flutter hanya akan merender tampilan item yang terlihat di layar dan tidak me-render seluruh item ListView di awal.
        ListView.builder memerlukan dua parameter yaitu itemBuilder dan itemCount. Parameter itemBuilder merupakan fungsi yang mengembalikan widget untuk ditampilkan. Sedangkan itemCount kita isi dengan jumlah seluruh item yang ingin ditampilkan.
         */

      // ListView.builder(
      //   itemCount: numberList.length,
      //   itemBuilder: (BuildContext context, int index){
      //     return Container(
      //       height: 250,
      //       decoration: BoxDecoration(
      //         color: Colors.grey,
      //         border: Border.all(color: Colors.black)
      //       ),
      //       child: Center(
      //         child: Text('${numberList[index]}',style: const TextStyle(fontSize: 50)),
      //       ),
      //     );
      //   },
      // )
    //         ----------------------------
        /*
        membuat ListView adalah dengan metode ListView.separated. ListView jenis ini akan menampilkan daftar item yang dipisahkan dengan separator. Penggunaan ListView.separated mirip dengan builder, yang membedakan adalah terdapat satu parameter tambahan wajib yaitu separatorBuilder yang mengembalikan Widget yang akan berperan sebagai separator.
         */
      ListView.separated(
        itemCount: numberList.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text('${numberList[index]}', style: const TextStyle(fontSize: 50)),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index){
          return const Divider();
        },
      )

    );
  }
}