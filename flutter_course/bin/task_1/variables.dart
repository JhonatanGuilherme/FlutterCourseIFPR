import 'dart:io';

void main(List<String> arguments) {
  stdout.write('Enter your name: ');
  var name = stdin.readLineSync();

  stdout.write('Enter your age: ');
  var age = int.parse(stdin.readLineSync()!);

  stdout.write('Enter your salary: ');
  var salary = double.parse(stdin.readLineSync()!);

  print('Hi, $name! Your age is $age and your salary is $salary!');
}
