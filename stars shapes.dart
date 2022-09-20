import 'dart:io';

void main() {
  stdout.write('Enter number of lines');
  dynamic input = stdin.readLineSync();
  input = int.parse(input);
  for (int l = 0; l < input; l++) {
    for (int j = 0; j < input - l - 1; j++) {
      stdout.write('#');
    }
    for (int s = 0; s < l * 2 + 1; s++) {
      stdout.write('*');
    }
    stdout.writeln('');
  }
}
