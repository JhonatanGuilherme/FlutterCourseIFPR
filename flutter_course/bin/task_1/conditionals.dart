import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  stdout.write('Enter your grade: ');
  var grade = double.parse(stdin.readLineSync()!), retakeGrade = 0.0;
  if (grade < 6) {
    stdout.write('Enter your retake grade: ');
    retakeGrade = double.parse(stdin.readLineSync()!);
  }
  stdout.write('Enter your class attendance as a percent: ');
  var attendance = int.parse(stdin.readLineSync()!);

  if ((grade < 6 && retakeGrade < 6) || attendance < 75) {
    stdout.write('You didn\'t pass. ');
    print(attendance < 75
        ? '${75 - attendance}% of attendance missing.'
        : '${(6 - [
              grade,
              retakeGrade
            ].reduce(max)).toStringAsFixed(1)} points missing.');
  } else {
    print('Congratulations, you passed!');
  }
}
