void main(List<String> arguments) {
  var names = ['Joaquim', 'Maria', 'Ana', 'Rivaldo', 'Paula'];

  names.add('Pedro');
  names.insert(0, 'Rebeca');
  names.removeAt(3);
  names.remove('Rivaldo');

  var listSize = names.length;

  print(names);
  print(listSize);

  print('WHILE STYLE');
  var counter = 0;
  while (counter < listSize) {
    print(names[counter++]);
  }

  print('DO WHILE STYLE');
  counter = 0;
  do {
    print(names[counter++]);
  } while (counter < listSize);

  print('FOR STYLE');
  for (var counter = 0; counter < listSize; counter++) {
    print(names[counter]);
  }

  print('FOR EACH GENERAL STYLE');
  for (var name in names) {
    print(name);
  }

  print('FOR EACH DIRECTLY BY LIST CALLING COMMON FUNCTION');
  names.forEach(printNames);

  print('FOR EACH DIRECTLY BY LIST CALLING ANONYMOUS FUNCTION');
  names.forEach((name) {
    print(name);
  });

  print('FOR EACH DIRECTLY BY LIST CALLING ARROW FUNCTION');
  names.forEach((name) => print(name));

  print('FOR EACH DIRECTLY BY LIST CALLING PRINT FUNCTION');
  names.forEach(print);
}

void printNames(String name) {
  print(name);
}
