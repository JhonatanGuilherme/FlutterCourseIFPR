import 'dart:io';

void main(List<String> arguments) {
  /*
    Questão - Verificar valores de renda para determinar
    a porcentagem de importo de renda que a pessoa deve pagar.
    A porcentagem é cobrado do valor do valor excendente.
      - Até 2000,00 está isento.
      - 2000,01 até 2500,00 paga 7%.
      - 3000,01 até 4000,00 paga 15%.
      - 4000,01 em diante paga 23%.
  */

  stdout.write('Digite o valor de sua renda: ');
  var income = double.parse(stdin.readLineSync()!);
  
  if (0.0 < income && income <= 2000.0) {
    print('Isento!');
  } else if (2000.0 < income && income <= 2500.0) {
    print('Valor de imposto: R\$ ${(income - 2000.0) * 0.07}');
  } else if (3000.0 < income && income <= 4000.0) {
    print('Valor de imposto: R\$ ${(income - 2500.0) * 0.15}');
  } else {
    print('Valor de imposto: R\$ ${(income - 2500.0) * 0.23}');
  }
}
