void main(List<String> arguments) {
  printHello();
  printNameWithParam('John');
  print(returnHello());
  print(returnNameWithParam('John'));
  askForMood('John', 15);
}

void printHello() {
  print('Hello!');
}

void printNameWithParam(String name) {
  print('Hello, $name!');
}

String returnHello() {
  return 'Hello!';
}

String returnNameWithParam(String name) {
  return 'Hello, $name!';
}

// Function with optional param
void askForMood(String name, [int age = 0]) {
  print('Hi, $name. You are $age years old!');
}

// Function with a function param
void test(Function someFunction) {
  someFunction();
}
