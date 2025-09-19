import 'dart:io';
// import 'package:project2/project2.dart' as project2;

// void main(List<String> arguments) {

//   // var fl= List<int>.filled(4, 5);
//   // fl[0] = 1;
//   // fl[1] = 2;
//   // fl[2] = 3;
//   // fl[3] = 4;
//   // // fl[4] = 5;

//   // //cetak

//   // stdout.writeln(fl);

//   //   var gl = [1,2,3,4];
//   //   gl.remove(1);
//   // stdout.writeln(gl);

// //   var setNilai1 = <int>{1,2,3,4};
// //   var setNilai2 = <int>{3,3,4,5,6};

// // print(setNilai2);
// // print(setNilai1);

// // print(setNilai1.union( setNilai2));
// // print(setNilai1.intersection(setNilai2));
// // print(setNilai1.difference(setNilai2));

//   // var setNilai1 = <int>{};
//   // var setNilai2 = <int>{1,2,3};

//   // stdout.writeln("Jumlah data setNilai2 =");
//   // String input = stdin.readLineSync()!;
//   // int jumlah = int.parse(input);
//   // for (var i = 0; i < jumlah; i++) {
//   //   stdout.writeln("Masukkan data ke-${i + 1}: ");
//   //   String input = stdin.readLineSync()!;
//   //   int nilai = int.parse(input);
//   //   setNilai1.add(nilai);
//   // }
//   // print(setNilai1);

//     var setNilai1 = <String>{};
//     // var setNilai2 = <int>{1,2,3};

//     stdout.writeln("Jumlah data setNilai1 =");
//     String input = stdin.readLineSync()!;
//     int jumlah = int.parse(input ?? '')??0;
//     for (var i = 0; i < jumlah; i++) {
//       stdout.writeln("Masukkan data ke-${i + 1}: ");
//       String input = stdin.readLineSync()!;
//       String nilai = input ?? '';
//       setNilai1.add(nilai);
//     }
//     print(setNilai1);
//     print(setNilai1.elementAt(1));
//   }

void main() {
  var sudah = {
  'nim': ['101','102','103'],
  'nama': ['Andi','Budi','Caca'],
  'umur': [20,21,22],
  };
  print(sudah);
  print(sudah['nama']);
  print(sudah['nama']![1]);
}
