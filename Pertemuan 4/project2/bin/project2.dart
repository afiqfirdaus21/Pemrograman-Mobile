import 'dart:io';
import 'package:project2/project2.dart' as project2;

void main(List<String> arguments) {

  var fl= List<int>.filled(4, 5);
  fl[0] = 1;
  fl[1] = 2;
  fl[2] = 3;
  fl[3] = 4;
  // fl[4] = 5;

  //cetak

  stdout.writeln(fl);

    var gl = [1,2,3,4];
    gl.remove(1);
  stdout.writeln(gl);
}


