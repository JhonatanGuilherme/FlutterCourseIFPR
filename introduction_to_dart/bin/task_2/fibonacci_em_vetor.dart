import 'dart:io';

void main() {
  const N = 60;
  var numbers = [0, 1], T = int.parse(stdin.readLineSync()!);

  for (var counter = 2; counter <= N; counter++) {
    numbers.add(numbers[counter - 1] + numbers[counter - 2]);
  }

  for (var counter = 0; counter < T; counter++) {
    var position = int.parse(stdin.readLineSync()!);
    print('Fib($position) = ${numbers[position]}');
  }
}
