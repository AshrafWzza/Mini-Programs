import 'dart:io';
// {([])} valid
// {(} invalid
void main() {
  stdout.writeln('enter a string');
  String? s = stdin.readLineSync();
  print(s);

  int? length = s?.length.toInt();
  print(length);

  int? lengthHalf = ((s?.length)! / 2).floor();
  print(lengthHalf);

  String? s1 = s?.substring(0, lengthHalf);
  String? s2;
  // * if length not even , +1 to remove the middle Character
  if (length! % 2 != 0) {
    s2 = s?.substring(lengthHalf + 1, length);
  } else {
    s2 = s?.substring(lengthHalf, length);
  }
  print('s1: $s1');
  print('s2: $s2');
  bool valid = true;

  if (s1?[0] == '(' || s1?[0] == '[' || s1?[0] == '{') {
    // * reverse order of s2 before comparing
    s2 = String.fromCharCodes(s2!.runes.toList().reversed);
    for (int i = 0; i < s2.length; i++) {
      valid = isValid(s1?[i], s2[i]);
      if (!valid) {
        print('invalid');
        break;
      }
    }
    if (valid) {
      print('valid');
    }
  } else {
    print('invalid');
  }
}

bool isValid(String? ss1, String? ss2) {
  switch (ss1) {
    case '(':
      if (ss2 == ')') {
        return true;
      } else {
        return false;
      }

    case '{':
      if (ss2 == '}') {
        return true;
      } else {
        return false;
      }
    case '[':
      if (ss2 == ']') {
        return true;
      } else {
        return false;
      }

    default:
      return false;
  }
}
