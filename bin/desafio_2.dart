import 'dart:io';
import 'alimento.dart';
import 'alimento_dao.dart';
import 'alimento_industrializado.dart';
import 'alimento_natural.dart';

// Funções
int showMainMenu() {
  print("++++MENU++++");
  print("1 - Para adicionar alimento");
  print("2 - Para ver lista de alimentos cadastrados");
  print("3 - Para ver o alimento");
  print("4 - Para atualizar o alimento");
  print("5 - Para Apagar o alimento");
  print("0 - Finalizar programa");
  int option = int.parse(stdin.readLineSync());
  return option;
}

int showCreateMenu() {
  print("++++MENU DE CRIAÇÃO++++");
  print("1 - Cadastrar alimento industrializado");
  print("2 - Cadastrar alimento natural");
  print("0 - Voltar");
  int option = int.parse(stdin.readLineSync());
  return option;
}

Alimento inputAlimento() {
  int option = showCreateMenu();

  print("Digite o codigo do alimento");
  String codigo = stdin.readLineSync();

  print("Digite o nome");
  String nome = stdin.readLineSync();

  print("Digite o nome científico");
  String cientifico = stdin.readLineSync();

  print("Digite o nome em inglês");
  String ingles = stdin.readLineSync();

  print("Digite o grupo");
  String grupo = stdin.readLineSync();

  switch (option) {
    case 1:
      print("Digite a marca do fabricante");
      String fabricante = stdin.readLineSync();

      return Industrializado(
        codigo,
        nome.split(','),
        ingles.split(','),
        cientifico,
        grupo,
        fabricante,
      );
    case 2:
      print("Digite a validade no formado yyyy-MM-dd (2021-09-01)");
      String validade = stdin.readLineSync();
      DateTime datetime = DateTime.parse(validade);

      return Natural(codigo, nome.split(','), ingles.split(','), cientifico,
          grupo, datetime);

    default:
      return null;
  }
}

// Função principal
void main(List<String> args) {
  final daoAlimento = AlimentoDAO();

  int option = -1;

  do {
    option = showMainMenu();

    switch (option) {
      case 1:
        final alimento = inputAlimento();
        daoAlimento.create(alimento);
        break;
      case 2:
        final alimentos = daoAlimento.listAll();
        break;
      case 3:
        print("Digite o codigo do alimento a ser codigoAlimento");
        String codigoAlimento = stdin.readLineSync();
        daoAlimento.getByCod(codigoAlimento);
        break;
      case 4:
        print("Digite o codigo do alimento a ser atualizado");
        String codigoAtualizar = stdin.readLineSync();
        daoAlimento.update(codigoAtualizar);
        break;
      case 5:
        print("Digite o codigo do alimento a ser excluido");
        String codigoExcluir = stdin.readLineSync();
        daoAlimento.delete(codigoExcluir);
        break;
      case 0:
        break;
      default:
        print('Comando invalido');
    }
  } while (option != 0);
}
